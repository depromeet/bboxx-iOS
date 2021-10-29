import SwiftUI

struct GrowthNoteResultView: View {
    
    @State var tag: Int? = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("네 감정을 담은 성장일기를 썼어")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundColor(Color("BboxxTextColor"))
                    
                    .padding(.top, 34)
                
                Spacer()
                
                Image(ImageAsset.writingIcon)
                    .frame(maxWidth: .infinity, maxHeight: 315)
                
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

struct GrowthNoteResultView_Previews: PreviewProvider {
    static var previews: some View {
        GrowthNoteResultView()
    }
}
