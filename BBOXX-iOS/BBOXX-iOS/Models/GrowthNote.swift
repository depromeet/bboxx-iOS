import Foundation

struct GrowthNote {
    let id = UUID()
    let date: String
    let title: String
    let content: String
    let feelings: [String]
    
    init(date: String, title: String, content: String, feelings: [String]) {
        self.date = date
        self.title = title
        self.content = content
        self.feelings = feelings
    }
}
