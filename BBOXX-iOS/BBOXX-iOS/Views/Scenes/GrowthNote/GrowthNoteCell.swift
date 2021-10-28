import SwiftUI

struct GrowthNoteCell: View {
    var date: String = ""
    var title: String = ""
    var content: String = ""
    
    init(date: String, title: String, content: String) {
        self.date = date
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.date)
                .font(.custom("HelveticaNeue", size: 12))
            
                .padding(.top, 20)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Text(self.title)
                .font(.custom("HelveticaNeue", size: 20))
                .bold()
                
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Text(self.content)
                .font(.custom("HelveticaNeue", size: 16))
            
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Spacer()
            
            TagView(tags: ["cat", "dog", "cat", "rabbit", "왜그랬지", "이불차기기"])
                .frame(height: 120)
                .background(Color.yellow)
                
                .padding(.leading, 18)
        }
        .frame(width: 315, height: 450)
        .background(Color.green)
        .cornerRadius(20)
    }
    
}
