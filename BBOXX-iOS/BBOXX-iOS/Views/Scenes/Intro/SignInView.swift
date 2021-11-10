import SwiftUI
import UIKit
import AuthenticationServices

// TODO: manage the asset names("") with Enum
struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    @State var shouldMoveToNextView: Bool = false

    var body: some View{
        NavigationView{
            VStack {
                Spacer()
                Text(viewModel.commentFirstLine)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                Text(viewModel.commentSecondLine)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, minHeight: 30, alignment: .center)
                Image(ImageAsset.BboxxIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal,20)
                    .frame(maxHeight: 172, alignment: .center)
                
                // Buttons
                VStack(spacing: 5){
                    
                    Button(action: {
                        viewModel.attemptAppleSignIn()
                    }, label: {
                        
                        Image(ImageAsset.startWithAppleButton)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 54, alignment: .center)
                    })
                    
                    Button(action: {
                        viewModel.attemptGoogleSignIn()
                        NavigationLink(destination: MainView().navigationBarHidden(true)){
                            Image(ImageAsset.startWithGoogleButton)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity,maxHeight: 54, alignment: .center)
                        }
                    }, label: {})
                    
                    
                    NavigationLink(destination:
                                    CreateNicknameView()
                                    .navigationBarHidden(true), tag: 1, selection: $viewModel.tag) {
                        EmptyView()
                    }
                    
                    NavigationLink(destination: MainView().navigationBarHidden(true), isActive: $shouldMoveToNextView){
                        Button(action: {
                            viewModel.attemptKakaoSignIn{
                                shouldMoveToNextView = true
                            } 
                        }, label: {
                            Image(ImageAsset.startWithKakaoButton)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity,maxHeight: 54, alignment: .center)
                        })
                    }
                }
                .padding()
                Spacer()
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BboxxBackgroundColor").ignoresSafeArea())
        }
    }
}
