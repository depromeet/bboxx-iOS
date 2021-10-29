import Foundation
extension UserDefaults {

    private enum Keys {

        static let nickName = "nickName"

    }

    class var nickNameKey: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.nickName) ?? "사랑스러운딸기"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.nickName)
        }
    }

}
