import Foundation

class CreateNicknameViewModel: ObservableObject {
    
    var nickname: String = ""
    
    func redoButtonDidTap() {
        UserService.shared.createNickname { (result) in
            switch result {
            case .success(let response):
                self.nickname = response.data.nickname
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
