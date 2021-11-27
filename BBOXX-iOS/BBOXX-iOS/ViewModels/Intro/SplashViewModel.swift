import SwiftUI

class SplashViewModel: ObservableObject {
    
    func checkFirstRun() -> Bool {
        let userDefault = UserDefaults.standard
        if userDefault.bool(forKey: "isFirstRun") {
            userDefault.set(false, forKey: "isFirstRun")
            return true
        } else {
            return false
        }
    }
}
