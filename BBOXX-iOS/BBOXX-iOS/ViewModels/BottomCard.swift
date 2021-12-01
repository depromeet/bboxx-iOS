import SwiftUI

struct BottomCard<Content: View>: View {
    let content: Content
        
    @Binding var cardShown: Bool
    @Binding var cardDismissal: Bool
    var isFeelingNoteCard: Bool
    
    let height: CGFloat
    
    init(cardShown: Binding<Bool>,
         cardDismissal: Binding<Bool>,
         height: CGFloat,
         isFeelingNoteCard: Bool = false,
         @ViewBuilder content: () -> Content
    ) {
        self.height = height
        _cardShown = cardShown
        _cardDismissal = cardDismissal
        self.isFeelingNoteCard = isFeelingNoteCard
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            // Dimmed
            GeometryReader { _ in
                EmptyView()
            }
            .background(isFeelingNoteCard ? Color.clear : Color.gray.opacity(0.5))
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

                .frame(maxWidth: .infinity, maxHeight: height)
                .offset(y: cardDismissal && cardShown ? 0 : height)
                .animation(isFeelingNoteCard ? Animation.default.delay(0) : Animation.default.delay(0.2))
                
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

struct CardContent: View {
    
    var title: String = ""
    var subTitle: String = ""
    
    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.custom("Pretendard-Bold", size: 28))
                .foregroundColor(Color("BboxxTextColor"))
                
                .padding(.top, 40)
            
            Text(subTitle)
                .font(.custom("Pretendard-Regular", size: 16))
                .foregroundColor(Color("BboxxGrayColor"))
                .opacity(0.6)
                
                .padding(.top, 8)
            
            HStack {
                Image(ImageAsset.trashIcon)
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200, alignment: .center)
                    
                    .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

            
        }
        
    }
}
