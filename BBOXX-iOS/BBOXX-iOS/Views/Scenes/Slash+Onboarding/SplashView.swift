import SwiftUI

struct SplashView: View {
    
    @State var removeSplash = false
    
    var body: some View {
        
        ZStack{
            OnboardingView()
            ZStack {
                Color("BboxxBackgroundColor")
                    .ignoresSafeArea()
                VStack(spacing: 50){
//                    if !removeSplash {
                        // Image ratio: 147px : 105px
                        Image("BboxxLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 98, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("bboxx")
                            .fontWeight(.bold)
//                    } else {
//                        OnboardingView()
//                    }
                }
            }
            .opacity(removeSplash ? 0 : 1)
        }
        .onAppear {
            // holding initial 3 sec
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                removeSplash = true
            }
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
