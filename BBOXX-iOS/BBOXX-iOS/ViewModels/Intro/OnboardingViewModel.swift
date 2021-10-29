import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    private var timer: Timer?
    var timeLeft = 3
    @Published var tag: Int? = 0
    
    init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
           
            self.timeLeft -= 1
            
            switch self.timeLeft {
            case 2: self.tag = 2
            case 1: self.tag = 1
            case 0: self.tag = 0
            default:
                self.tag = 0
            }
        })
    }
}
