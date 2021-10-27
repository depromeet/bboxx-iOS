import Foundation

struct GrowthNote {
    let id = UUID()
    let date: String
    let title: String
    let content: String
    
    init(date: String, title: String, content: String) {
        self.date = date
        self.title = title
        self.content = content
    }
}
