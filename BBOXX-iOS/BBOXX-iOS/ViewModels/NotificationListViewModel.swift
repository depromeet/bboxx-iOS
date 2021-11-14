import SwiftKeychainWrapper

class NotificationListViewModel: ObservableObject {
    
    var dateString: String = ""
    
    @Published var notifications: [Notification] = []
    var feelingNote: FeelingNote?
    
    init() {
        convertCurrentDate()
        getNotifications(memberId: KeychainWrapper.standard.integer(forKey: "memberId") ?? 0)
    }
    
    func convertCurrentDate() {
        let nowDate = Date() // 현재의 Date
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM. dd."
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateString = dateFormatter.string(from: nowDate)
    }
    
    func getNotifications(memberId: Int) {
        NotificationService.shared.getNotifications(memberId) { (result) in
            switch result {
            case .success(let response):
                self.notifications = response.data
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getFeelingNote(feelingNoteId: Int, completion: @escaping () -> Void) {
        FeelingNoteService.shared.getFeelingNote(feelingNoteId) { (result) in
            switch result {
            case .success(let response):
                self.feelingNote = response.data
                completion()
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
