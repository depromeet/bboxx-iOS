import SwiftUI

struct OnBoardingView: View {
    
    @State var offset: CGFloat = 0
    @State var willMoveToNextScreen = false
    @ObservedObject var viewModel = OnboardingViewModel()
    var body: some View {
        NavigationView{
            OffsetPageTabView(offset: $offset) {
                
                HStack(spacing: 0){
                    
                    ForEach(boardingScreens){screen in
                        
                        VStack(spacing: 30){
                            Text(screen.comment)
                                .font(.system(size: 23))
                                .fontWeight(.bold)
                                .grayscale(9.0)
                                .frame(maxWidth: .infinity,alignment: .center)
                            
                            Image(screen.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: (getScreenBounds().width / 2) * 2, height: getScreenBounds().width / 2)
                                .scaleEffect(getScreenBounds().height < 750 ? 0.7 : 1)
                        }
                        .padding()
                        .frame(width: getScreenBounds().width)
                        .frame(maxHeight: .infinity)
                    }
                }
            }
            .background(
                Color("BboxxBackgroundColor")
                    .animation(.easeInOut)
            )
            .ignoresSafeArea(.container, edges: .all)
            .overlay(
                Button(action: {
                }) { NavigationLink(destination: OnboardingLastView()) {
                    Text("건너뛰기")
                        .fontWeight(.semibold)
                        .grayscale(6.0)
                        .foregroundColor(.gray)
                }
                }
                    .padding(.bottom,60)
                    .padding(.horizontal,8)
                ,alignment: .bottom
            )
            NavigationLink(destination:
                            OnboardingLastView()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(false), tag: 0, selection: self.$viewModel.tag) {
                EmptyView()
            }
        }
    }
}
extension View{
    func getScreenBounds()->CGRect{
        return UIScreen.main.bounds
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
