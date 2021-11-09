import SwiftUI

struct GrowthNoteDetailView: View {
    
    var growthNote = GrowthNote(content: "", createAt: "", emotionDiaryId: 0, id: 0, memberId: 0, tags: [], title: "", updateAt: "")
    
    var backgroundColor: Color = .white
    
    @Environment(\.presentationMode) var presentationMode
    
    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(ImageAsset.backButton)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    })
                    .frame(
                        alignment: .topLeading
                    )
                }
                .padding(.top, 16)
                .padding(.leading, 16)
                
                Text(self.growthNote.createAt)
                    .font(.custom("Pretendard-Medium", size: 12))
                    .foregroundColor(.white)
                
                    .padding(.top, 20)
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                
                Text(self.growthNote.title)
                    .font(.custom("Pretendard-Bold", size: 20))
                    .foregroundColor(.white)
                    
                    .padding(.top, 10)
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                
                Text(self.growthNote.content)
                    .font(.custom("Pretendard-Regular", size: 16))
                    .foregroundColor(.white)
                
                    .padding(.top, 10)
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                
                TagView(tags: self.growthNote.tags ?? [])
                    .frame(height: 120)
                    
                    .padding(.top, 20)
                    .padding(.leading, 16)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor.ignoresSafeArea())
        
        .navigationBarHidden(true)
    }
}
