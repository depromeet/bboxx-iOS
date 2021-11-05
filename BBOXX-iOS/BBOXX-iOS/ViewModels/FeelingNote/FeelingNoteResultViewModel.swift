import Foundation

class FeelingNoteResultViewModel: ObservableObject {
    var nickName: String {
        return UserDefaults.standard.string(forKey: "nickname") ?? "사랑스러운딸기"
    }
}
