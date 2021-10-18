import SwiftUI

struct FeelingNoteView: View {
    
    @ObservedObject var feelingNoteViewModel = FeelingNoteViewModel()
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("네 감정을 글로 담아봐")
                .font(.custom("HelveticaNeue", size: 24))
            
                .padding(.top, 10)
                .padding(.leading, 24)
            
            VStack {
                HStack {
                    Text("09. 17. 월요일")
                        .font(.custom("HelveticaNeue", size: 12))
                    
                    Spacer()
                    
                    Text("\(content.count)/1200")
                        .font(.custom("HelveticaNeue", size: 12))
                }
                .padding(.top, 30)
                .padding(.leading, 24)
                .padding(.trailing, 24)
                
                TextField("지금 내 감정은..", text: $title)
                    .font(.custom("HelveticaNeue", size: 20))
                    
                    .padding(.top, 16)
                    .padding(.leading, 24)
                    .padding(.trailing, 56)
                
                Divider()
                    .padding(.top, 10)
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                
                TextEditor(text: $content)
                    .font(.custom("HelveticaNeue", size: 16))
                    
                    .padding(.top, 10)
                    .padding(.leading, 24)
                    .padding(.trailing, 31)
                
                Button("다 썼어", action: {
                    
                })
                .frame(maxWidth: .infinity, maxHeight: 54)
                .background(Color.yellow)
                .cornerRadius(10)
                
                .padding(.top, 20)
                .padding(.leading, 24)
                .padding(.trailing, 24)
                .padding(.bottom, 30)
            }
            .background(Color.white)
            .cornerRadius(24, corners: [.topLeft, .topRight])
            
            .padding(.top, 20)
            
        }
        .background(Color.yellow)
    }
}

struct FeelingNoteView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingNoteView()
    }
}
