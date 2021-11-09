import Foundation
import SwiftKeychainWrapper

// 참고 : https://velog.io/@jins0704/Alamofire%EC%97%90-%EB%8C%80%ED%95%B4

// Network Logging 을 위함 참고한 곳 : https://ios-development.tistory.com/733

class CreateNicknameViewModel: ObservableObject {
    
    @Published var nickname: String = ""
    
    init() {
        createNickname()
        //regiseterDeciber()
        
    }
    
    func redoButtonDidTap() {
        createNickname()
    }
    
    func createNickname() {
        UserService.shared.createNickname { (result) in
            switch result {
            case .success(let response):
                self.nickname = response.data.nickname
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
    
    //  authData : 소셜 로그인 Token
    //  providerType : 소셜 로그인 종류 ("KAKAO", "GOOGLE", "APPLE" ##대문자로 보내야함)
    //  호출 위치 : 소셜 로그인 후
    //  response 데이터 token 값이 Jwt
//    func authSignIn()  {
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
//
//    //  호출 위치 : 닉네임 확정 후 다음 화면으로 넘어갈때
//    //  response 데이터 token 값이 Jwt
//    func authSignUp() {
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
