import SwiftUI

struct BottomCard<Content: View>: View {
    let content: Content
    
    @Binding var cardShown: Bool
    @Binding var cardDissmissal: Bool
    
    let height: CGFloat
    
    init(cardShown: Binding<Bool>,
         cardDissmissal: Binding<Bool>,
         height: CGFloat,
         @ViewBuilder content: () -> Content
    ) {
        self.height = height
        _cardShown = cardShown
        _cardDissmissal = cardDissmissal
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            // Dimmed
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.5))
            .opacity(cardShown ? 1 : 0)
            .animation(Animation.easeIn)
            .onTapGesture {
                self.dismiss()
            }
            
            // Card
            VStack {
                Spacer()
                
                VStack {
                    content

                }
                .background(Color.white)
                .cornerRadius(24, corners: [.topLeft, .topRight])

                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: height)
                .offset(y: cardDissmissal && cardShown ? 0 : height)
                .animation(Animation.default.delay(0.2))
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func dismiss() {
        cardDissmissal.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.25, execute: {
            cardShown.toggle()
        })
    }
}
