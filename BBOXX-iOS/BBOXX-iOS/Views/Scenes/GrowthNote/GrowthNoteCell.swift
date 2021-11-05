import SwiftUI

struct GrowthNoteCell: View {
    var date: String = ""
    var title: String = ""
    var content: String = ""
    var feelings: [String] = []
    var backgroundColor: Color = .white
    
    init(date: String, title: String, content: String, feelings: [String], backgroundColor: Color) {
        self.date = date
        self.title = title
        self.content = content
        self.feelings = feelings
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.date)
                .font(.custom("Pretendard-Medium", size: 12))
                .foregroundColor(.white)
            
                .padding(.top, 20)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Text(self.title)
                .font(.custom("Pretendard-Bold", size: 20))
                .foregroundColor(.white)
                
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Text(self.content)
                .font(.custom("Pretendard-Regular", size: 16))
                .foregroundColor(.white)
            
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                        
            TagView(tags: self.feelings)
                .frame(height: 120)
                
                .padding(.leading, 10)
        }
        .frame(width: 315, height: 450)
        .background(backgroundColor)
        .cornerRadius(20)
    }
    
}
