import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = SignInViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .signedIn: ContentView()
        case .signedOut: SignInView(viewModel: viewModel)
        }
    }
    
    // TODO: add check signInState logic
}
