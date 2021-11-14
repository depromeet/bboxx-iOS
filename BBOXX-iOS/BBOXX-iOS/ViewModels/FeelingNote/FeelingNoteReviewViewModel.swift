import Foundation

class FeelingNoteReviewViewModel: ObservableObject {
    
    var dateString: String = ""
    
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
    
    func deleteFeelingNote(feelingNoteId: Int) {
        FeelingNoteService.shared.deleteFeelingNote(feelingNoteId) { (result) in
            switch result {
            case .success(let response):
                print(response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
