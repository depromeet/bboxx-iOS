import Foundation

class SelectFeelingViewModel: ObservableObject {
    typealias FeelingTitle = String
    typealias IsSelected = Bool
    @Published var emotions: [Emotion] = []
    var selectedEmotions: [FeelingTitle: IsSelected] = [:]
    var selectedFeelingCount = 0
    
    init() {
        self.getEmotions()
    }
    
    func getEmotions(){
        FeelingNoteService.shared.getEmotions { [weak self] result in
            switch result{
            case .success(let response):
                self?.emotions = response.data.emotions
                response.data.emotions.forEach { emotion in
                    self?.selectedEmotions[emotion.status] = false
                }
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
}
