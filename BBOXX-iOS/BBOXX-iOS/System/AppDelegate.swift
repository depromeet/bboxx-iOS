import UIKit
import Firebase
import GoogleSignIn

import KakaoSDKCommon
import KakaoSDKAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
    -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url, options: options)
        }
        
        print(#function)
        return GIDSignIn.sharedInstance.handle(url)
    }
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        
        KakaoSDKCommon.initSDK(appKey: Secret.KakaoAppKey, loggingEnable:false)

        return true
    }
}
