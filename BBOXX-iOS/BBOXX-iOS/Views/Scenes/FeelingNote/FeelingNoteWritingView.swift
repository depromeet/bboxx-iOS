import SwiftUI

struct FeelingNoteWritingView: View {
    
    @ObservedObject var viewModel = FeelingNoteWritingViewModel()
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    @State private var cardShown: Bool = false
    @State private var cardDismissal: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("네 감정을 글로 담아봐")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundColor(Color("BboxxTextColor"))
                    
                    .padding(.top, 10)
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
                    
                    TextField("지금 내 감정은..", text: $title)
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
                    
                    Button(action: {
                        cardShown.toggle()
                        cardDismissal.toggle()
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
        
    }

}

struct FeelingNoteWritingView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingNoteWritingView()
    }
}
