import Foundation

struct Notification: Identifiable {
    let id = UUID()
    let currentDate: String
    let date: String
    let content: String
    
    init(currentDate: String, date: String, content: String) {
        self.currentDate = currentDate
        self.date = date
        self.content = content
    }
}
