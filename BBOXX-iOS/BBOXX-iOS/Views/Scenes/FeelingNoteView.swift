import SwiftUI

struct FeelingNoteView: View {
    
    @ObservedObject var feelingNoteViewModel = FeelingNoteViewModel()
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    let textViewMinHeight: CGFloat = 150
    @State private var textViewHeight: CGFloat?
    
    var body: some View {
        VStack {
            Text("지금 네 감정을 글로 써봐")
                .font(.custom("HelveticaNeue", size: 20))
            
            Spacer().frame(height: 20)
            
            VStack{
                Spacer().frame(height: 15)
                
                HStack {
                    Text(self.feelingNoteViewModel.dateString)
                        .font(.custom("HelveticaNeue", size: 16))
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image("redo")
                            .frame(width: 7, height: 4)
                            .padding(.trailing, 5)
                        
                        Text("다시쓰기")
                            .font(.custom("HelveticaNeue", size: 15))
                    }
                    .padding(.trailing, 17)
                }
                
                Spacer().frame(height: 15)
                
                ScrollView() {
                    TextField("지금 네 감정은..", text: $title)
                        .font(.custom("HelveticaNeue", size: 20))
                        
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    WrappedTextView(text: $content, textDidChange: self.textDidChange)
                        .font(.custom("HelveticaNeue", size: 16))
                        .frame(height: textViewHeight ?? textViewMinHeight)
                    
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                }
                
                Spacer().frame(height: 13)
                
                HStack {
                    Spacer()
                    
                    Text("\(self.content.count)/1200")
                        .font(.custom("HelveticaNeue", size: 12))
                        
                        .padding(.trailing, 20)
                        .padding(.bottom, 24)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
            )
            
            .padding(.leading, 25)
            .padding(.trailing, 25)
            
            Spacer().frame(height: 17)
            
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
    
    private func textDidChange(_ textView: UITextView) {
        self.textViewHeight = max(textView.contentSize.height, textViewMinHeight)
    }
}

struct FeelingNoteView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingNoteView()
    }
}