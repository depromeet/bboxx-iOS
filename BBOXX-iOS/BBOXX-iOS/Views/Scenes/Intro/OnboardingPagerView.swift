import SwiftUI
import SwiftUIPager

struct OnboardingPagerView: View {
    
    @StateObject var page: Page = .first()
    @State var pageOffset: Double = 0
    @State var onboardingContetns = boardingScreens
    @ObservedObject var viewModel = OnboardingViewModel()
    
    var data = Array(0..<6)
    
    var body: some View {
        NavigationView {
            VStack{
                Pager(page: self.page,
                      data: self.data,
                      id: \.self) { page in
                    self.pageView(page)
                }
                      .pageOffset(pageOffset)
                      .swipeInteractionArea(.allAvailable)
                
                NavigationLink(destination: SignInView().navigationBarHidden(true)) {
                    Text(viewModel.isLastView(page.index) ? "시작하기" : "건너뛰기")
                        .font(.custom("Pretendard-Medium", size: 16))
                        .foregroundColor(Color("BboxxGrayColor").opacity(0.6))
                }
                .padding(.bottom, 65)
            }
            .navigationBarHidden(true)
            
            .background(Color("BboxxBackgroundColor").ignoresSafeArea())
        }
    }
    
    func pageView(_ page: Int) -> some View {
        VStack(spacing: 60) {
            VStack(spacing: 60) {
                let comment = onboardingContetns[page].comment
                let image = onboardingContetns[page].image
                Text("\(comment)")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundColor(Color("BboxxTextColor"))
                    .multilineTextAlignment(.center)
                Image(image)
                    .resizable()
                    .frame(width: 240, height: 240, alignment: .center)
                
            }.frame(alignment: .top)
            
        }
    }
    
}

struct OnboardingPagerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPagerView()
    }
}
