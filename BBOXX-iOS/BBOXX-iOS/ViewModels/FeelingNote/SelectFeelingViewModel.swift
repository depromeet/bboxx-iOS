import Foundation

class SelectFeelingViewModel: ObservableObject {
    // TODO: change type of 'feelings'
    var emotions: [Emotion] = []
    
    init() {
        self.getEmotions()
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

// TODO: remove
//struct Emotion: Identifiable {
//    var id: ObjectIdentifier
//}
