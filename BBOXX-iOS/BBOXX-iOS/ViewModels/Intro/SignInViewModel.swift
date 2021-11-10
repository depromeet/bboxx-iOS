import Combine
import FirebaseAuth
import Firebase
import GoogleSignIn
import KakaoSDKAuth
import KakaoSDKUser
import SwiftUI
import SwiftKeychainWrapper
import UIKit

class SignInViewModel: ObservableObject {
    
    private(set) var commentFirstLine = "아래 방법 중에 하나로 시작하면"
    private(set) var commentSecondLine = "나랑 함께할 수 있어"
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    
    @Published var tag: Int? = 0
    
    private lazy var appleSignInCoordinator = AppleSignInCoordinator(signInVM: self)
    
    func attemptAppleSignIn() {
        appleSignInCoordinator.handleAuthorizationAppleIDButtonPress()
    }
    
    func attemptGoogleSignIn() {
        if GIDSignIn.sharedInstance.currentUser == nil {
            // TODO: presenting Sign In View
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)
            
            // Sign in flow
            GIDSignIn.sharedInstance.signIn(with: config, presenting: (UIApplication.shared.windows.first?.rootViewController)!) { [unowned self] user, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard
                    let authentication = user?.authentication,
                    let idToken = authentication.idToken
                else {
                    return
                }
                
                // TODO: Credential
                //                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                //                                                               accessToken: authentication.accessToken)
                
                // Using Token
            }
        }
    }
    
    func attemptKakaoSignIn(completion: @escaping () -> Void) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // If KakaoTalk is installed, log in from KakaoTalk
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                
                if let accessToken = oauthToken?.accessToken {
                    AuthService.shared.signIn(accessToken, ProviderType.kakao.rawValue){(result) in
                        switch result{
                        case .success(let response):
                            switch response.code {
                            case "200":
                                KeychainWrapper.standard.set(response.data.token, forKey: "token")
                                completion()
                            case "201":
                                KeychainWrapper.standard.set(response.data.token, forKey: "token")
                                completion()
                            default:
                                // 로그인 실패 시, 닉네임 생성 화면으로 이동
                                self.tag = 1
                            }
                            
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                        
                    }
                }
            }
        }else{
            // If KakaoTalk is not installed, log in from Safari
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                
                if let accessToken = oauthToken?.accessToken {
                    AuthService.shared.signIn(accessToken, ProviderType.kakao.rawValue){(result) in
                        switch result{
                        case .success(let response):
                            switch response.code {
                            case "200":
                                KeychainWrapper.standard.set(response.data.token, forKey: "token")
                                completion()
                            case "201":
                                KeychainWrapper.standard.set(response.data.token, forKey: "token")
                                completion()
                            default:
                                // 로그인 실패 시, 닉네임 생성 화면으로 이동
                                self.tag = 1
                            }
                            
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                        
                    }
                }
            }
        }
        
        UserApi.shared.me() {(user, error) in
            // Get user information
            let email = user?.kakaoAccount?.email
            let age = user?.kakaoAccount?.ageRange
            let gender = user?.kakaoAccount?.gender
            print("\(email), \(age), \(gender)")
        }
    }
    
    //  authData : 소셜 로그인 Token
    //  providerType : 소셜 로그인 종류 ("KAKAO", "GOOGLE", "APPLE" ##대문자로 보내야함)
    //  호출 위치 : 소셜 로그인 후
    //  response 데이터 token 값이 Jwt
    //    func signIn(authData: String, providerType: ProviderType)  {
    //        AuthService.shared.signIn("Tasduat", "KAKAO"){(result) in
    //            switch result{
    //            case .success(let response):
    //                if( response.code == "200"){
    //
    //                }
    //            case .failure(let error):
    //                print(error.localizedDescription)
    //            }
    //
    //        }
    //    }
    
    //  호출 위치 : 닉네임 확정 후 다음 화면으로 넘어갈때
    //  response 데이터 token 값이 Jwt
    //    func signUp() {
    //        AuthService.shared.signUp("Tasduat", self.nickname, "KAKAO"){(result) in
    //            switch result{
    //            case .success(let response):
    //                if( response.code == "200"){
    //
    //                }
    //            case .failure(let error):
    //                print(error.localizedDescription)
    //            }
    //
    //        }
    //    }
}
