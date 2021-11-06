import SwiftUI

class FeelingNoteWritingViewModel: ObservableObject {
    
    var dateString: String = ""
    
    @Published var buttonState: Bool = false
    @Published var limitTextCount: Bool = false
        
    init() {
        convertCurrentDate()
    }
    
    func convertCurrentDate() {
        let nowDate = Date() // 현재의 Date
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM. dd. EEEE"
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateString = dateFormatter.string(from: nowDate)
    }
    
    func checkButtonState(title: String, content: String) {
        if title.count > 0 && content.count > 0 && content.count <= 1200 {
            buttonState = true
            limitTextCount = false
        } else if content.count > 1200 {
            buttonState = false
            limitTextCount = true
        } else {
            buttonState = false
        }
    }
}
