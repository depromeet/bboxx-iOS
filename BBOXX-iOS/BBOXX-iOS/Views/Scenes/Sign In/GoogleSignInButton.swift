import UIKit
import SwiftUI
import GoogleSignIn

// MARK: Not Using Now
struct GoogleSignInButton: UIViewRepresentable {
    typealias UIViewType = GIDSignInButton
    func makeUIView(context: Context) -> GIDSignInButton {
        return GIDSignInButton()
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: Context) {
    }
}

