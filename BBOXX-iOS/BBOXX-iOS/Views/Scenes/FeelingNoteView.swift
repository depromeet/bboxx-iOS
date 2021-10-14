import SwiftUI

struct FeelingNoteView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        VStack {
            Text("지금 네 감정을 글로 써봐")
                .font(.custom("HelveticaNeue", size: 24))
            
            Spacer().frame(height: 20)
            
            HStack {
                Text("21.09.17. 월")
                    .font(.custom("HelveticaNeue", size: 16))
                    .padding(.leading, 20)
                
                Spacer()
                
                Button("다시쓰기", action: {
                    
                })
                .padding(.trailing, 17)
            }
            
            Spacer().frame(height: 15)
            
            ScrollView() {
                TextField("지금 네 감정은..", text: $title)
                    .font(.custom("HelveticaNeue", size: 20))
                    .lineLimit(2)
                    
                    .padding(.leading, 20)
                    .padding(.trailing, 17)
                
                TextEditor(text: $content)
                    .font(.custom("HelveticaNeue", size: 16))
                    .frame(minWidth: 10, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
                    .border(Color.yellow)
                    
                    .padding(.top, 10)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
            }
            
            Spacer().frame(height: 13)
            
            HStack {
                Spacer()
                
                Text("0/500")
                    .padding(.trailing, 21)
            }
            
            //            }
            //            .frame(maxWidth: .infinity)
            //            .overlay(
            //                RoundedRectangle(cornerRadius: 20)
            //                    .stroke(Color.black, lineWidth: 1)
            //            )
            
            Spacer().frame(height: 21)
            
            Button("다 썼어!", action: {
                
            })
            .frame(maxWidth: .infinity, maxHeight: 54)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
            
            .padding(.leading, 25)
            .padding(.trailing, 25)
            .padding(.bottom, 20)
        }
    }
}

struct FeelingNoteView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingNoteView()
    }
}
