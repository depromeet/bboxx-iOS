import Foundation

class GrowthNoteWritingViewModel: ObservableObject {
    var dateString: String = ""
    
    @Published var buttonState: Bool = false
    @Published var limitTextCount: Bool = false
    
    init() {
        convertCurrentDate()
    }
    
    func convertCurrentDate() {
        let nowDate = Date() // 현재의 Date
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "M. dd. EEEE"
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
    
    func postFeelingNote(_ content: String,
                         _ feelingNoteId: Int,
                         _ memberId: Int,
                         _ tags: [String],
                         _ title: String) {
        GrowthNoteService.shared.postGrowthNote(content, feelingNoteId, memberId, tags, title) { (result) in
            switch result {
            case .success(let response):
                print(response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
