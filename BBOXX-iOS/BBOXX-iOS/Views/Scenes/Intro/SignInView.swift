import SwiftUI
import UIKit
import AuthenticationServices

// TODO: manage the asset names("") with Enum
struct SignInView: View {
    
    @ObservedObject var viewModel = SignInViewModel()

    var body: some View{
        NavigationView{
            VStack(alignment: .center) {
                Spacer()
                
                Text("아래 방법 중에 하나로 시작하면\n나랑 함께할 수 있어")
                    .multilineTextAlignment(.center)
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundColor(Color("BboxxGrayColor"))
                
                Image(ImageAsset.signIn_logo)
                    .resizable()
                    .frame(width: 240, height: 240, alignment: .center)
                
                Spacer()
                
                Button(action: {
                    viewModel.attemptAppleSignIn()
                }, label: {
                    
                    Image(ImageAsset.startWithAppleButton)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 54, alignment: .center)
                })
                                    
                NavigationLink(destination: MainView()
                                .navigationBarHidden(true), tag: 1, selection: $viewModel.tag) {
                    EmptyView()
                }
                
                NavigationLink(destination: CreateNicknameView()
                                .navigationBarHidden(true), tag: 2, selection: $viewModel.tag) {
                    EmptyView()
                }
                
                Button(action: {
                    viewModel.attemptKakaoSignIn()
                }, label: {
                    Image(ImageAsset.startWithKakaoButton)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity,maxHeight: 54, alignment: .center)
                })
                .padding(.top, 10)
                .padding(.bottom, 30)
            }
            .navigationBarHidden(true)
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BboxxBackgroundColor").ignoresSafeArea())
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
