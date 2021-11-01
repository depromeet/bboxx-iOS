import SwiftUI

struct GrowthNoteWritingView: View {
    
    @ObservedObject var viewModel = GrowthNoteWritingViewModel()
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    @State private var cardShown: Bool = false
    @State private var cardDismissal: Bool = false
    
    @State private var tag: Int? = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            cardShown.toggle()
                            cardDismissal.toggle()
                        }, label: {
                            Image(ImageAsset.backButton)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("BboxxTextColor").opacity(0.7))
                        })
                        .frame(
                            alignment: .topLeading
                        )
                        .padding(.leading, 16)

                        Spacer()

                        Button(action: {
                            self.title = ""
                            self.content = ""
                        }, label: {
                            Image(ImageAsset.redoButton)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("BboxxGrayColor").opacity(0.6))

                            Text("다시쓰기")
                                .font(.custom("Pretendard-Medium", size: 14))
                                .foregroundColor(Color("BboxxGrayColor").opacity(0.6))
                        })
                        .frame(
                            alignment: .topTrailing
                        )
                        .padding(.top, 3)
                        .padding(.trailing, 16)
                    }
                    .padding(.top, 16)
                    
                    Text("네 생각을 글로 담아봐")
                        .font(.custom("Pretendard-Bold", size: 24))
                        .foregroundColor(Color("BboxxTextColor"))
                        
                        .padding(.top, 26)
                        .padding(.leading, 24)
                    
                    VStack {
                        HStack {
                            Text(self.viewModel.dateString)
                                .font(.custom("Pretendard-Medium", size: 12))
                                .foregroundColor(Color("BboxxGrayColor"))
                                .opacity(0.85)
                            
                            Spacer()
                            
                            Text("\(content.count)/1200")
                                .font(.custom("Pretendard-Regular", size: 12))
                                .foregroundColor(Color("BboxxGrayColor"))
                                .opacity(0.4)
                        }
                        .padding(.top, 30)
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                        
                        TextField("지금 내 생각은..", text: $title)
                            .font(.custom("Pretendard-Bold", size: 20))
                            
                            .padding(.top, 16)
                            .padding(.leading, 24)
                            .padding(.trailing, 56)
                        
                        Divider()
                            .padding(.top, 10)
                            .padding(.leading, 24)
                            .padding(.trailing, 24)
                        
                        TextEditor(text: $content)
                            .font(.custom("Pretendard-Regular", size: 16))
                            .foregroundColor(Color("BboxxTextColor"))
                            
                            .padding(.top, 10)
                            .padding(.leading, 24)
                            .padding(.trailing, 31)
                        
                        NavigationLink(destination:
                                        GrowthNoteResultView()
                                        .navigationBarBackButtonHidden(false)
                                        .navigationBarHidden(true)
                                       , tag: 1, selection: self.$tag) {
                            EmptyView()
                        }
                        
                        Button(action: {
                            self.tag = 1

                        }, label: {
                            Text("다 썼어")
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(.white)
                        })
                        .frame(maxWidth: .infinity, maxHeight: 56)
                        .background(Color("BboxxGrayColor"))
                        .cornerRadius(16)
                        
                        .padding(.top, 20)
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                        .padding(.bottom, 30)
                    }
                    .background(Color.white)
                    .cornerRadius(24, corners: [.topLeft, .topRight])
                    
                    .padding(.top, 20)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BboxxBackgroundColor").ignoresSafeArea())
                
                BottomCard(cardShown: $cardShown,
                           cardDissmissal: $cardDismissal,
                           height: UIScreen.main.bounds.height/1.5) {
                    CardContent()
                }
                .animation(.default)
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct GrowthNoteWritingView_Previews: PreviewProvider {
    static var previews: some View {
        GrowthNoteWritingView()
    }
}
