import SwiftUI

struct GrowthNoteCell: View {
    
    var growthNote: GrowthNote
    var backgroundColor: Color
    
    init(growthNote: GrowthNote, backgroundColor: Color) {
        self.growthNote = growthNote
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(convertDate())
                .font(.custom("Pretendard-Medium", size: 12))
                .foregroundColor(.white)
            
                .padding(.top, 20)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Text(growthNote.title)
                .font(.custom("Pretendard-Bold", size: 20))
                .foregroundColor(.white)
                
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Text(growthNote.content)
                .font(.custom("Pretendard-Regular", size: 16))
                .foregroundColor(.white)
            
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                        
            TagView(tags: growthNote.tags ?? [])
                .frame(height: 120)
                
                .padding(.leading, 10)
        }
        .frame(width: 315, height: 450)
        .background(backgroundColor)
        .cornerRadius(20)
    }
    
    func convertDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let convertDate = dateFormatter.date(from: growthNote.createAt) // Date 타입으로 변환
                
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy년 M월" // 2020년 08월 13일 오후 04시 30분
        myDateFormatter.locale = Locale(identifier:"ko_KR") // PM, AM을 언어에 맞게 setting (ex: PM -> 오후)
        
        return myDateFormatter.string(from: convertDate!)
    }
}
