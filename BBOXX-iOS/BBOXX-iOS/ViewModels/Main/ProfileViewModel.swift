import Foundation

class ProfileViewModel: ObservableObject {
    func registerToken(memberId: Int, FCMToken: String) {
        NotificationService.shared.registerToken(memberId, FCMToken) { (result) in
            switch result {
            case .success(let response):
                print(response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deregisterToken(memberId: Int) {
        NotificationService.shared.deregisterToken(memberId) { (result) in
            switch result {
            case .success(let response):
                print(response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
