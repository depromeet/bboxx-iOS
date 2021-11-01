import SwiftUI

struct BottomCard<Content: View>: View {
    let content: Content
    
    var firstButtonText: String = ""
    var secondButtonText: String = ""
    
    @Binding var cardShown: Bool
    @Binding var cardDissmissal: Bool
    
    let height: CGFloat
    
    init(firstButtonText: String,
         secondButtonText: String,
         cardShown: Binding<Bool>,
         cardDissmissal: Binding<Bool>,
         height: CGFloat,
         @ViewBuilder content: () -> Content
    ) {
        self.firstButtonText = firstButtonText
        self.secondButtonText = secondButtonText
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

                    HStack {
                        Button(action: {
                            self.dismiss()
                        }, label: {
                            Text(firstButtonText)
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(Color("BboxxTextColor"))
                                .opacity(0.6)
                        })
                        .frame(width: 156, height: 56, alignment: .center)
                        
                        Spacer().frame(width: 19)
                        
                        Button(action: {
                            // 뒤로 가기 액션
                        }, label: {
                            Text(secondButtonText)
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(Color.white)
                        })
                        .frame(width: 156, height: 56, alignment: .center)
                        .background(Color("BboxxGrayColor"))
                        .cornerRadius(16)
                        
                    }
                    .padding(.top, 38)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.bottom, 30)
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
            
            Image(ImageAsset.trashIcon)
                .resizable()
                .frame(width: 180, height: 180, alignment: .center)

                .padding(.top, 20)
            
        }
        
    }
}
