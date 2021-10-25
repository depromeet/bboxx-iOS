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

                    HStack {
                        Button(action: {
                            // 뒤로 가기 액션
                        }, label: {
                            Text("그만쓸래")
                                .font(.custom("HelveticaNeue", size: 18))
                                .foregroundColor(Color.black)
                        })
                        .frame(width: 156, height: 56, alignment: .center)
                        
                        Spacer().frame(width: 19)
                        
                        Button(action: {
                            self.dismiss()
                        }, label: {
                            Text("계속쓸래")
                                .font(.custom("HelveticaNeue", size: 18))
                                .foregroundColor(Color.white)
                        })
                        .frame(width: 156, height: 56, alignment: .center)
                        .background(Color.black)
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
    var body: some View {
        VStack(alignment: .center) {
            Text("그만쓰고싶어?")
                .font(.custom("HelveticaNeue", size: 28))
                
                .padding(.top, 40)
            
            Text("돌아가면 쓰던 글이 없어져")
                .font(.custom("HelveticaNeue", size: 16))
                
                .padding(.top, 8)
            
            Image("")
                .frame(width: 200, height: 200, alignment: .center)
                .background(Color.gray)
                
                .padding(.top, 20)
            
        }
        
    }
}