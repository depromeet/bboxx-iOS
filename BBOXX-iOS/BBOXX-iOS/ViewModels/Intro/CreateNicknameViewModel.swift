import Foundation
import SwiftKeychainWrapper

// 참고 : https://velog.io/@jins0704/Alamofire%EC%97%90-%EB%8C%80%ED%95%B4

// Network Logging 을 위함 참고한 곳 : https://ios-development.tistory.com/733

class CreateNicknameViewModel: ObservableObject {
    
    @Published var nickname: String = ""
    
    @Published var tag: Int? = 0
    
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
                switch response.code {
                case "200":
                    self.nickname = response.data.nickname
                    self.signUp(KeychainWrapper.standard.string(forKey: "authData") ?? "",
                                self.nickname,
                                UserDefaults.standard.string(forKey: "providerType") ?? "")
                    UserDefaults.standard.set(self.nickname, forKey: "nickname")
                default:
                    print(response.code)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func signUp(_ authData: String, _ nickname: String, _ providerType: String) {
        AuthService.shared.signUp(authData, nickname, providerType){(result) in
            switch result{
            case .success(let response):
                switch response.code {
                case "200":
                    KeychainWrapper.standard.set(response.data.token, forKey: "token")
                    self.tag = 1
                default:
                    print(response.code)
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
                switch response.code {
                case "200":
                    KeychainWrapper.standard.set(response.data.id, forKey: "memberId")
                default:
                    print(response.code)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
}
