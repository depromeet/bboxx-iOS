import AuthenticationServices

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
            do {
                let token = try JSONDecoder().decode(String.self, from: appleToken)
                // 로그인 요청
                AuthService.shared.signIn(token, "APPLE") { result in
                    switch result {
                    case .success(let response):
                        print(response)
                    case .failure(let error):
                        debugPrint("error occured: \(error)")
                    }
                }
            } catch {
                debugPrint("error occured: \(error)")
            }
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // TODO: add alert
        print(error.localizedDescription)
    }
}
