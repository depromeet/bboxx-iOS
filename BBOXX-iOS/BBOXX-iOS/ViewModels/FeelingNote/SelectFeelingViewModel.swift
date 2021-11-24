import Foundation

class SelectFeelingViewModel: ObservableObject {
    
    @Published var emotions: [Emotion] = []
    
    init() {
        self.getEmotions()
    }
    
    func getEmotions(){
        FeelingNoteService.shared.getEmotions { [weak self] result in
            switch result{
            case .success(let response):
                self?.emotions = response.data.emotions
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
}
