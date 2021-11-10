import Foundation

class DecibelMeasurementResultViewModel: ObservableObject {
    
    var decibel = 0
    
    init(decibel: Int) {
        self.decibel = decibel
        
        postDecibel(decibel: decibel, memberId: 0)
    }
    
    func postDecibel(decibel: Int, memberId: Int) {
        DecibelService.shared.postDecibel(decibel, memberId) { (result) in
            switch result {
            case .success(let response):
                print(response.data.id ?? 0)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
