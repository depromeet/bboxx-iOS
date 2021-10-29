import SwiftUI
import UIKit.UIColor

struct OnboardingLastView: View {

    var body: some View {
        NavigationView {
            HStack(spacing: 0){
                VStack(spacing: 30){
                    let screen = lastOnboardingScreens
                    Text(screen.comment)
                        .font(.system(size: 23))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity,alignment: .center)

                    Image(screen.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: (getScreenBounds().width / 2) * 2, height: getScreenBounds().width / 2)
                        .scaleEffect(getScreenBounds().height < 750 ? 0.7 : 1)
                    VStack(spacing: 10) {
                        NavigationLink(destination: SignInView(viewModel: SignInViewModel())){
                            Button(action: {}, label: {
                                Text("응, 좋아")
                                    .foregroundColor(Color.white)
                            })
                                .frame(height: 50)
                                .frame(maxWidth: 350)
                                .background(
                                    // TODO: Dark Gray
                                    RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.gray)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                                        .strokeBorder(Color.gray, lineWidth: 1)
                                )
                        }

                        NavigationLink(destination: SignInView(viewModel: SignInViewModel())){
                            Button(action: {}) {
                                Text("아니, 싫어")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.system(size: 18))
                                    .padding()
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                }
                .padding()
                .frame(width: .infinity)
                .frame(maxHeight: .infinity)
            }

            .background(
                Color("BboxxBackgroundColor")
                    .animation(.easeInOut)
            )
            .ignoresSafeArea(.container, edges: .all)
        }
        .navigationBarHidden(true)
    }
}

struct OnboardingLastView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLastView()
    }
}
