import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .signedIn: ContentView()
        case .signedOut: LoginView(viewModel: viewModel)
        }
    }
    
    // TODO: add check signInState logic
}
