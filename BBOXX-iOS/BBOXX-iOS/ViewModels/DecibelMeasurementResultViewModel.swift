import Foundation

class DecibelMeasurementResultViewModel: ObservableObject {
    
    var decibel = 0
    
    init(decibel: Int) {
        self.decibel = decibel
    }
}
