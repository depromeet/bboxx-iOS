import Foundation

class FeelingNoteRemindViewModel: ObservableObject {
        
    func postFeelingNote(categorId: Int,
                         content: String,
                         emotionStatusList: [Int],
                         memberId: Int,
                         title: String) {
        FeelingNoteService.shared.postFeelingNote(categorId,
                                                  content,
                                                  emotionStatusList,
                                                  memberId,
                                                  title) { (result) in
            switch result {
            case .success(let response):
                print(response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
