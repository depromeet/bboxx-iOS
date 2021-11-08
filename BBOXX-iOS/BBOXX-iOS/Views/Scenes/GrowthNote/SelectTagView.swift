import SwiftUI

struct SelectTagView: View {
    
    @State var tags: [Tag] = TagList().tags
    @State var text: String = ""
    var selectedCount = 0
    @State var enableButton: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                NavigationLink(destination:
                                MainView()
                                .navigationBarHidden(true)) {
                    Image(ImageAsset.backButton)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("BboxxGrayColor"))
                        .frame(
                            alignment: .topTrailing
                        )
                    
                        .padding(.top, 16)
                        .padding(.trailing, -8)
                }
                Spacer()
            }
            .background(
                
                Color("BboxxBackgroundColor")
                    .ignoresSafeArea()
            )
            .padding(.leading, 20)
            VStack(spacing: 80){
                VStack(spacing: 10) {
                    Text("지금 내 감정은..")
                        .font(.system(size: 38, weight: .bold))
                        .font(.custom("Pretendard-Bold", size: 24))
                        .foregroundColor(Color("BboxxTextColor"))
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Text("최대 다섯개까지 선택해봐")
                        .font(.custom("Pretendard-SemiBold", size: 18))
                        .foregroundColor(Color("BboxxTextColor"))
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
                
                TagCollectionView(maxLimit: 150, tags: $tags, fontSize: 16)
                    .frame(height: 280)
                    .padding(.top,20)
                Button {
                } label: {
                    Text("이 감정을 글로 써볼래")
                        .fontWeight(.semibold)
                        .foregroundColor(enableButton ? Color(.white) : Color("BboxxGrayColor"))
                        .padding(.vertical,20)
                        .padding(.horizontal,85)
                        .background(enableButton ? Color("BboxxGrayColor") : Color(.white))
                        .cornerRadius(10)
                }
                .frame(alignment: .bottom)
                .padding(15)
                .disabled(enableButton)
                
            }
            .padding([.leading, .top], 20)
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            
        }
        .background(
            
            Color("BboxxBackgroundColor")
                .ignoresSafeArea()
        )
    }
}

struct SelectTagView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTagView()
    }
}
