import Foundation

class SelectFeelingViewModel: ObservableObject {
    // TODO: change type of 'feelings'
    var feelings: [Emotion] = []
    
    init() {
        self.fetchFeelings()
    }
    
    func fetchFeelings(){
        // TODO: call API
    }
}

// TODO: remove
struct Emotion: Identifiable {
    var id: ObjectIdentifier
}
