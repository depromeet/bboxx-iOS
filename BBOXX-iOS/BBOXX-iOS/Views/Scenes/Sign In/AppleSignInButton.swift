import UIKit
import SwiftUI
import AuthenticationServices

// MARK: Not Using Now
struct AppleSignInButton: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton()
    }
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context:
                        Context) {
    }
}
