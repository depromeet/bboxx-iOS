import SwiftUI

struct SplashView: View {
    
    @State var removeSplash1: Bool = false
    @State var removeSplash2: Bool = false
    
    var body: some View {
        
        ZStack{
            OnBoardingView()
            ZStack {
                Image(ImageAsset.splash_background2)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                // TODO: add BACKGROUND Color
                ZStack {
                    Image(ImageAsset.splash_background1)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .opacity(removeSplash1 ? 0 : 1)
                // TODO: add BACKGROUND Color
            }
            .opacity(removeSplash2 ? 0 : 1)
            
        }
        .ignoresSafeArea(.all)
        .onAppear {
            // holding initial 6 sec
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                removeSplash1 = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    removeSplash2 = true
                       
                }
                    
            }
            
        }
    }
}
