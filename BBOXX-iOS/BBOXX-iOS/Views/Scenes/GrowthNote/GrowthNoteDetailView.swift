import SwiftUI

struct GrowthNoteDetailView: View {
    
    var growthNote: GrowthNote
    var backgroundColor: Color
    
    @Environment(\.presentationMode) var presentationMode
    
    init(growthNote: GrowthNote, backgroundColor: Color) {
        self.growthNote = growthNote
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
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
            
            Text(convertDate())
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
    
    func convertDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        guard let convertDate = dateFormatter.date(from: growthNote.createAt) else { return growthNote.createAt } // Date ???????????? ??????
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy??? M???" // 2020??? 08??? 13??? ?????? 04??? 30???
        myDateFormatter.locale = Locale(identifier:"ko_KR") // PM, AM??? ????????? ?????? setting (ex: PM -> ??????)
        
        return myDateFormatter.string(from: convertDate)
    }
}
