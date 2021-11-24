import AuthenticationServices
import UIKit

// Used in Sign In view model
class AppleSignInCoordinator: NSObject, ASAuthorizationControllerDelegate {
    var signInService: AuthService
    var signInViewModel: SignInViewModel
    
    init(signInService: AuthService = AuthService(), signInVM: SignInViewModel) {
        self.signInViewModel = signInVM
        self.signInService = signInService
    }
    
    // Shows Sign in with Apple UI
    func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    // Delegate methods
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            // 유저 정보
//            let userIdentifier = appleIDCredential.user
//            let fullName = appleIDCredential.fullName
//            let email = appleIDCredential.email ?? ""
//            let name = (fullName?.givenName ?? "") + (" ") + (fullName?.familyName ?? "")
            
            // 토큰
            guard let appleToken = appleIDCredential.identityToken else { return }
            guard let token = String(data: appleToken, encoding: .utf8) else { return }
            // 로그인 요청
            self.signInViewModel.signIn(token, ProviderType.apple.rawValue)
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        let alert = UIAlertController()
        alert.title = "로그인 실패"
        alert.message = "다시 시도해주세요 🥺"
        
        // TODO: import Google Crashlytics Log
        print(error.localizedDescription)
    }
}
