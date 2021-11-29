import Foundation

class GrowthNoteDetailContentViewModel: ObservableObject {
    
    @Published var feelingNote: FeelingNote?
    
    init(emotionId: Int) {
        fetchParentFeelingNote(emotionId: emotionId) { feelingNote in
            self.feelingNote = feelingNote
        }
    }
    
    func fetchParentFeelingNote(emotionId: Int, completion: @escaping (FeelingNote) -> Void) {
        FeelingNoteService.shared.getFeelingNote(emotionId) { result in
            switch result {
            case .success(let response):
                completion(response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
