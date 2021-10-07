import SwiftUI
import UIKit
import AuthenticationServices

struct SignInView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            
            Button("Sign in with Kakao") {
                // TODO: add action
            }
            Spacer()
            
            Button("Sign in with Google") {
                // TODO: add action
            }
            .buttonStyle(AuthenticationButtonStyle())
            
            Spacer()
            AppleSignInButton().onTapGesture {
                self.viewModel.attemptAppleSignIn()
            }
        }
    }
}

struct AuthenticationButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemIndigo))
            .cornerRadius(12)
            .padding()
    }
}
