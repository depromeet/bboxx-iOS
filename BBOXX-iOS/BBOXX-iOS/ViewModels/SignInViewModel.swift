import Combine
import GoogleSignIn

class SignInViewModel: ObservableObject {
    
    enum SignInState {
      case signedIn
      case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    
    private lazy var appleSignInCoordinator = AppleSignInCoordinator(loginVM: self)
        
    func attemptAppleSignIn() {
        appleSignInCoordinator.handleAuthorizationAppleIDButtonPress()
    }
    
    func attemptGoogleSignIn() {
        if GIDSignIn.sharedInstance.currentUser == nil {
            // TODO: presenting Sign In View
        }
    }
    
}
