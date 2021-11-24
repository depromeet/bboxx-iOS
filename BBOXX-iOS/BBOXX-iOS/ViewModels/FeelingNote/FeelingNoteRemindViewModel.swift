import SwiftUI

class FeelingNoteRemindViewModel: ObservableObject {
    
    @Published var emotions: [Emotion] = []
    
    init() {
        getEmotions()
    }
        
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
    
    func getEmotions(){
        FeelingNoteService.shared.getEmotions { (result) in
            switch result{
            case .success(let response):
                self.emotions = response.data.emotions
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
}
