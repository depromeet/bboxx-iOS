import SwiftUI

struct FeelingNoteDeleteCompleteView: View {
    
    @State var tag: Int? = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("네 이번 감정을 완전히 지웠어")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundColor(Color("BboxxTextColor"))
                    
                    .padding(.top, 34)
                
                Text("네 이번 감정을 완전히 지웠어")
                    .font(.custom("Pretendard-Regular", size: 14))
                    .foregroundColor(Color("BboxxGrayColor").opacity(0.7))
                    
                    .padding(.top, 11)
                
                
                Image(ImageAsset.heartBoxIcon)
                    .resizable()
                    .frame(maxWidth: 240, maxHeight: 240)
                
                    .padding(.top, 43)
                
                
                Spacer()
                
                NavigationLink(destination:
                                GrowthNoteCollectionView()
                                .navigationBarBackButtonHidden(false)
                                .navigationBarHidden(true)
                               , tag: 1, selection: self.$tag) {
                    EmptyView()
                }
                
                Button(action: {
                    self.tag = 1
                }, label: {
                    Text("보러가기")
                        .font(.custom("Pretendard-SemiBold", size: 18))
                        .foregroundColor(.white)
                })
                .frame(maxWidth: .infinity, maxHeight: 56)
                .background(Color("BboxxGrayColor"))
                .cornerRadius(16)
                
                .padding(.bottom, 30)
            }
            .padding(.leading, 24)
            .padding(.trailing, 24)
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BboxxBackgroundColor").ignoresSafeArea())
        }
    }
}

struct FeelingNoteDeleteCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingNoteDeleteCompleteView()
    }
}
