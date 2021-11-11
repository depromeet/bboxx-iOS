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
    
    func attemptKakaoSignIn() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // If KakaoTalk is installed, log in from KakaoTalk
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                
                if let authData = oauthToken?.accessToken {
                    self.signIn(authData, ProviderType.kakao.rawValue)
                }
            }
        }else{
            // If KakaoTalk is not installed, log in from Safari
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                
                if let authData = oauthToken?.accessToken {
                    self.signIn(authData, ProviderType.kakao.rawValue)
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
    
    func signIn(_ authData: String, _ providerType: String) {
        AuthService.shared.signIn(authData, providerType){(result) in
            switch result{
            case .success(let response):
                if response.data.token != "" {
                    self.tag = 1
                    KeychainWrapper.standard.set(response.data.token, forKey: "token")
                    self.getMe()
                } else {
                    // 로그인 실패 시, 닉네임 생성 화면으로 이동
                    self.tag = 2
                    // 회원가입을 위해 소셜 로그인 토큰 값과 소셜 정보 저장
                    KeychainWrapper.standard.set(authData, forKey: "authData")
                    UserDefaults.standard.setValue(providerType, forKey: "providerType")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func getMe(){
        UserService.shared.getMe{ (result) in
            switch result{
            case .success(let response):
                KeychainWrapper.standard.set(response.data.id, forKey: "memberId")
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
}
