import SwiftUI

struct SplashView: View {
    
    @State var removeSplash1: Bool = false
    @State var removeSplash2: Bool = false
    
    var body: some View {
        
        ZStack{
            OnboardingPagerView()
            
            ZStack {
                Color("BboxxGrayColor")
                
                VStack{
                    Image(ImageAsset.splash_logo)
                        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 1.5)
                    Spacer()
                }
                
                Image(ImageAsset.splash_open)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                
                ZStack {
                    Image(ImageAsset.splash_close)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                }
                .opacity(removeSplash1 ? 0 : 1)
                    
            }
            .opacity(removeSplash2 ? 0 : 1)
            
        }
        .ignoresSafeArea(.all)
        .onAppear {
            // holding initial 4 sec
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                removeSplash1 = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    removeSplash2 = true
                       
                }
                    
            }
            
        }
    }
}
