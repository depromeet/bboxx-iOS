import Foundation
import SwiftKeychainWrapper
import SwiftUI

class ProfileViewModel: ObservableObject {
    
    var nickname: String {
        return UserDefaults.standard.string(forKey: "nickname") ?? "사랑스러운딸기"
    }
    
    @Published var notiBinding = true
    
    init() {
        registerToken(memberId: KeychainWrapper.standard.integer(forKey: "memberId") ?? 0, FCMToken: KeychainWrapper.standard.string(forKey: "FCMToken") ?? "")
    }
    
    func toggleSwitch() {
        if notiBinding {
            registerToken(memberId: KeychainWrapper.standard.integer(forKey: "memberId") ?? 0, FCMToken: KeychainWrapper.standard.string(forKey: "FCMToken") ?? "")
        } else {
            deregisterToken(memberId: KeychainWrapper.standard.integer(forKey: "memberId") ?? 0)
        }
    }
    
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
