import UIKit
import Firebase
import GoogleSignIn
import UserNotifications

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
        
        return GIDSignIn.sharedInstance.handle(url)
    }
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        KakaoSDKCommon.initSDK(appKey: Secret.KakaoAppKey, loggingEnable:false)
        
        // 대리인에게 실행 프로세스가 거의 완료되었으며 앱을 실행할 준비가 되었음을 알림
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        
        // Messaging Delegate
        Messaging.messaging().delegate = self
        
        // 앱 또는 앱 확장에 대한 알림 관련 작업을 관리하기 위한 중앙 개체. 앱 또는 확장자에 대한 공유 사용자 알림 센터 개체를 반환. 들어오는 알림 및 알림 관련 작업을 처리하는 개체.
        UNUserNotificationCenter.current().delegate = self
    
        // 취소 승인 옵션
        let authOptions: UNAuthorizationOptions = [.badge, .sound, .alert]
        
        // 로컬 및 원격 알림이 사용자의 장치로 전달될 때 사용자와 상호 작용할 수 있는 권한 부여를 요청.
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in })
    
        // Apple 푸시 알림 서비스를 통해 원격 알림을 수신하도록 등록
        application.registerForRemoteNotifications()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // 가져올 데이터가 있음을 나타내는 원격 알림이 도착했음을 앱에 알림
        if let messageID = userInfo[Secret.gcmMessageIDKey] {
            debugPrint("🔔 messageID: ", messageID)
        }
        completionHandler(UIBackgroundFetchResult.newData)
    }
}

// 수신 알림 및 알림 관련 작업을 처리하기 위한 protocol
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        // foreground에서 실행되는 동안 도착한 알림 처리
        let userInfo = notification.request.content.userInfo
        if let messageID = userInfo[Secret.gcmMessageIDKey]{
            debugPrint("🔔 messageID: ", messageID)
        }
        if let data1 = userInfo[Secret.data1Key] {
            debugPrint("🔔 data1: ", data1)
        }
        if let data2 = userInfo[Secret.data2Key] {
            debugPrint("🔔 data2: ", data2)
        }
        if let apsData = userInfo[Secret.aps] {
            debugPrint("🔔 apsData: ", apsData)
        }
        // TODO 여기 추가구현
        completionHandler([[.banner, .badge, .sound]])
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 앱이 APNS에 성공적으로 등록되었음을 대리자에게 알림
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        debugPrint("🔔💥 APNS가 등록 프로세스를 성공적으로 완료할 수 없어 대리인에게 전송 되었음")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // 전달된 알림에 대한 사용자의 응답을 처리하도록 대리인에게 요청합니다.
        let userInfo = response.notification.request.content.userInfo
        
        if let messagID = userInfo[Secret.gcmMessageIDKey] {
            debugPrint("🔔 messageID from userNotificationCenter didReceive: ", messagID)
        }
        completionHandler()
    }
}
extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let deviceToken: [String: String] = ["token": fcmToken ?? ""]
        // 이 토큰은 FCM 알림 테스트에 사용됩니다.
        debugPrint("🔔 Device Token: ", deviceToken)
    }
}

