import SwiftUI
import UIKit
import AuthenticationServices

// TODO: manage the asset names("") with Enum
struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    var body: some View{
        
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
                }, label: {
                    
                    Image(ImageAsset.startWithGoogleButton)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity,maxHeight: 54, alignment: .center)
                })
                
                Button(action: {}, label: {
                    Image(ImageAsset.startWithKakaoButton)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity,maxHeight: 54, alignment: .center)
                })
            }
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BboxxBackgroundColor").ignoresSafeArea())
    }
}
