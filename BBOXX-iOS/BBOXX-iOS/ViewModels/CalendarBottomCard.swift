import SwiftUI

struct CalendarBottomCard: View {
    @Binding var cardShown: Bool
    @Binding var cardDismissal: Bool
    
    let height: CGFloat
    
    init(cardShown: Binding<Bool>,
         cardDismissal: Binding<Bool>,
         height: CGFloat
    ) {
        self.height = height
        _cardShown = cardShown
        _cardDismissal = cardDismissal
    }
    
    var body: some View {
        ZStack {
            // Dimmed
            GeometryReader { _ in
                EmptyView()
            }
            .opacity(cardShown ? 1 : 0)
            .animation(Animation.easeIn)
            .onTapGesture {
                self.dismiss()
            }
            
            // Card
            VStack {
                Spacer()
                
                VStack {
                    

                }
                .background(Color.white)
                .cornerRadius(24, corners: [.topLeft, .topRight])

                .frame(maxWidth: .infinity, maxHeight: height)
                .offset(y: cardDismissal && cardShown ? 0 : height)
                .animation(Animation.default.delay(0.2))
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func dismiss() {
        cardDismissal.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.25, execute: {
            cardShown.toggle()
        })
    }
}
