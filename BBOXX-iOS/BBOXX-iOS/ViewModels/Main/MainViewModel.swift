import Foundation

class MainViewModel: ObservableObject {
    
    var nickName: String {
        return UserDefaults.standard.string(forKey: UserDefaults.nickNameKey) ?? "사랑스러운딸기"
    }
}
