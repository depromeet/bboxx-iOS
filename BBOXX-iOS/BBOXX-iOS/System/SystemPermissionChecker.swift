import UIKit
import SwiftUI

class SystemPermissionChecker {
    
    static let shared = SystemPermissionChecker()
    private let center = UNUserNotificationCenter.current()
    private var reReqeustTimeCount: Int = 0
    private var availableToRequest: Bool { reReqeustTimeCount < 3 }
    
    func checkCurrentNotiPermission(completion: @escaping () -> Void) {
        
        // 권한 설정 확인
        center.getNotificationSettings(completionHandler: { [weak self] settings in
            switch settings.authorizationStatus {
            case .authorized, .provisional: // 허용, 임시 허용
                completion()
            case .denied, .notDetermined, .ephemeral: // 거절, 아직 결정 안함, 짧게 허용(iOS 14.0 +)
                self?.requestNotiAuthorization(completion: {
                    completion()
                })
            @unknown default:
                self?.requestNotiAuthorization(completion: {
                    completion()
                })
            }
        })
    }
    
    private func requestNotiAuthorization(completion: @escaping () -> Void) {
        
        // 권한 요청
        center.requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, error in
            if error != nil {
                debugPrint("Push Notification Permission Request Error 😵")
            }
            
            if granted { // 권한 허용됨
                completion()
            } else {
                guard let self = self else { return }
                if self.availableToRequest  { // 재요청 2번 이하일 경우
                    self.reReqeustTimeCount += 1
                    self.requestNotiAuthorization(completion: { // 권한 허용 거절 시 재요청
                        completion()
                    })
                    
                }
            }
        }
    }
}


