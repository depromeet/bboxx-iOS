import SwiftUI
import SwiftUIPager

struct OnboardingPagerView: View {
    
    @StateObject var page: Page = .first()
    @State var pageOffset: Double = 0
    @State var onboardingContetns = boardingScreens
    
    var data = Array(0..<6)
    
    var body: some View {
        VStack{
            Pager(page: self.page,
                  data: self.data,
                  id: \.self) { page in
                if pageOffset >= 5 {
                    OnboardingLastView()
                } else {
                    self.pageView(page)
                }
            }
                  .pageOffset(pageOffset)
                  .swipeInteractionArea(.allAvailable)
            NavigationLink(destination: OnboardingLastView().navigationBarHidden(true)) {
                Text("건너뛰기")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 60)
        }.background(Color("BboxxBackgroundColor").ignoresSafeArea())
        
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
                .frame(width: 200, height: 200, alignment: .center)
           
            }.frame(alignment: .top)
            
        }
    }
    
}

struct OnboardingPagerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPagerView()
    }
}
