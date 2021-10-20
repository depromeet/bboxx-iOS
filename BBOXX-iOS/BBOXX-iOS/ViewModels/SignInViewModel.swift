import Combine
import GoogleSignIn
import FirebaseAuth
import Firebase
import SwiftUI
import UIKit

class SignInViewModel: ObservableObject {
    
    enum SignInState {
      case signedIn
      case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    
    private lazy var appleSignInCoordinator = AppleSignInCoordinator(signInVM: self)
        
    func attemptAppleSignIn() {
        appleSignInCoordinator.handleAuthorizationAppleIDButtonPress()
    }
    
    func attemptGoogleSignIn() {
        if GIDSignIn.sharedInstance.currentUser == nil {
            // TODO: presenting Sign In View
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }

            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)

            // Sign in flow
            GIDSignIn.sharedInstance.signIn(with: config, presenting: (UIApplication.shared.windows.first?.rootViewController)!) { [unowned self] user, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard
                    let authentication = user?.authentication,
                    let idToken = authentication.idToken
                else {
                    return
                }
                
                // Credential
//                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                               accessToken: authentication.accessToken)
                
                // Using Token
            }
        }
    }
}
