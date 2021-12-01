import SwiftUI

struct CalendarBottomCard: View {
    @Binding var cardShown: Bool
    @Binding var cardDismissal: Bool
    
    let height: CGFloat
    
    var flexibleLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var months = [
        ImageAsset.janIcon, ImageAsset.febIcon, ImageAsset.marIcon, ImageAsset.aprIcon,
        ImageAsset.mayIcon, ImageAsset.junIcon, ImageAsset.julIcon, ImageAsset.augIcon,
        ImageAsset.sepIcon, ImageAsset.octIcon, ImageAsset.novIcon, ImageAsset.decIcon
                ]
    
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
                    HStack(alignment: .center) {
                        Button(action: {
                            //self.viewModel.leftButtonDidTap()
                        }, label: {
                            Image(ImageAsset.leftSmallIcon)
                                .renderingMode(.template)
                                .foregroundColor(Color("BboxxGrayColor").opacity(0.3))
                                .frame(width: 24, height: 24)
                                .disabled(true)
                        })
                        
                        Text("2021")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(Color("BboxxTextColor"))
                            
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        Button(action: {
                            //self.viewModel.rightButtonDidTap()
                        }, label: {
                            Image(ImageAsset.rightSmallIcon)
                                .renderingMode(.template)
                                .foregroundColor(Color("BboxxGrayColor").opacity(0.3))
                                .frame(width: 24, height: 24)
                                .disabled(true)
                        })
                    }
                    .padding(.top, 41)
                    
                    HStack {
                        Spacer()
                        
                        LazyVGrid(columns: flexibleLayout, spacing: 16) {
                            ForEach(months, id: \.self) { month in
                                Image(month)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            }
                        }.frame(maxWidth: 290, maxHeight: .infinity)
                        
                        Spacer()
                    }
                    .padding(.bottom, 20)
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
