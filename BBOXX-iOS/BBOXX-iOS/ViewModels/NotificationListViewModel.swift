import Foundation

class NotificationListViewModel: ObservableObject {
    
    var dateString: String = ""
    
    init() {
        convertCurrentDate()
    }
    
    func convertCurrentDate() {
        let nowDate = Date() // 현재의 Date
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM. dd."
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateString = dateFormatter.string(from: nowDate)
    }
}
