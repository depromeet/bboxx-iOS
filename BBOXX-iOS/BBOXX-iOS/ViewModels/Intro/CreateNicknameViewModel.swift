import Foundation
import SwiftKeychainWrapper

class CreateNicknameViewModel: ObservableObject {
    
    @Published var nickname: String = ""
    
    @Published var tag: Int? = 0
    
    init() {
        createNickname()
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
    
    func signUp(_ authData: String, _ nickname: String, _ providerType: String) {
        AuthService.shared.signUp(authData, nickname, providerType){(result) in
            switch result{
            case .success(let response):
                self.tag = 1
                self.getMe()
                KeychainWrapper.standard.set(response.data.token, forKey: "token")
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
                UserDefaults.standard.set(self.nickname, forKey: "nickname")
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
}
