import SwiftUI
import Firebase

@main
struct BBOXX_iOSApp: App {
    
    // for using third-party 
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
