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
                        
            TagView(tags: self.feelings)
                .frame(height: 120)
                
                .padding(.leading, 10)
        }
        .frame(width: 315, height: 450)
        .background(Color.white)
        .cornerRadius(20)
    }
    
}
