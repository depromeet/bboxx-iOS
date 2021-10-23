import AuthenticationServices

// Used in Sign In view model
class AppleSignInCoordinator: NSObject, ASAuthorizationControllerDelegate {
    var signInService: SignInService
    var signInViewModel: SignInViewModel
    
    init(signInService: SignInService = SignInService(), signInVM: SignInViewModel) {
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
            
            // Get user details
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email ?? ""
            let name = (fullName?.givenName ?? "") + (" ") + (fullName?.familyName ?? "")
            // TODO: - Make network request to backend
            // Save user details or fetch them
            // Sign in with Apple only gives full name and email once
            // signInService.callAppleAuthCallback()
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // TODO: add alert
        print(error.localizedDescription)
    }
}
