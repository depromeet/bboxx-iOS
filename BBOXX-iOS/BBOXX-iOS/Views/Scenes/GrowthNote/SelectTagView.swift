import SwiftUI

struct SelectTagView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var tags: [Tag] = TagList().tags
    @State var text: String = ""
    var selectedCount = 0
    @State var enableButton: Bool = false
    var feelingNoteId: Int = 0
    
    @State var tag: Int? = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BboxxBackgroundColor").ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(ImageAsset.backButton)
                                .renderingMode(.template)
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("BboxxGrayColor").opacity(0.7))
                                .frame(
                                    alignment: .topTrailing
                                )
                                
                                .padding(.top, 16)
                                .padding(.leading, 16)
                        }
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("지금 내 감정은..")
                            .font(.custom("Pretendard-Bold", size: 24))
                            .foregroundColor(Color("BboxxTextColor"))
                            
                            .padding(.top, 20)
                        
                        Text("최대 다섯개까지 선택해봐.")
                            .font(.custom("Pretendard-Regular", size: 14))
                            .foregroundColor(Color("BboxxGrayColor").opacity(0.6))
                            
                            .padding(.top, 10)
                        
                        Spacer()
                        
                        ScrollView() {
                            TagCollectionView(tags: self.tags)
                                .padding(.top, 20)
                                .padding(.bottom, 20)
                        }
                        
                        Spacer()
                        
                        // 선택된 태그들 같이 보내야 하는 코드 필요
                        NavigationLink(destination:
                                        GrowthNoteWritingView()
                                        .navigationBarHidden(true), tag: 1, selection: $tag) {
                            EmptyView()
                        }
                        
                        Button(action: {
                            self.tag = 1
                        }, label: {
                            Text("이 감정을 글로 써볼래")
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(.white)
                        })
                        .frame(maxWidth: .infinity, maxHeight: 56)
                        .background(Color("BboxxTextColor"))
                        .cornerRadius(16)
                        .disabled(enableButton)
                        
                        .padding(.top, 20)
                        .padding(.trailing, 24)
                        .padding(.bottom, 30)
                        
                    }
                    .padding(.leading, 24)
                    
                }.navigationBarHidden(true)
                
            }
        }
    }
}

struct SelectTagView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTagView()
    }
}
