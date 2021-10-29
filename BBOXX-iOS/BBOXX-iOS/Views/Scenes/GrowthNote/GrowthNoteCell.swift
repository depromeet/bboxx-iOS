import SwiftUI

struct GrowthNoteCell: View {
    var date: String = ""
    var title: String = ""
    var content: String = ""
    var feelings: [String] = []
    
    init(date: String, title: String, content: String, feelings: [String]) {
        self.date = date
        self.title = title
        self.content = content
        self.feelings = feelings
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
        .background(Color(red: 164 / 255, green: 93 / 255, blue: 99 / 255))
        .cornerRadius(20)
    }
    
}
