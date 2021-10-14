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
                Spacer().frame(width: 25)
                
                ScrollView() {
                    VStack {
                        Spacer().frame(width: 16)
                        
                        HStack {
                            Spacer().frame(width: 20)
                           
                            Text("21.09.17. 월")
                                .font(.custom("HelveticaNeue", size: 16))
                            
                            Spacer()
                            
                            Button("다시쓰기", action: {
                                
                            })
                            
                            Spacer().frame(width: 17)
                        }
                        
                        Spacer().frame(height: 15)
                        
                        HStack {
                            Spacer().frame(width: 20)
                            
                            TextField("지금 네 감정은..", text: $title)
                                .font(.custom("HelveticaNeue", size: 20))
                                .lineLimit(2)
                            
                            Spacer().frame(width: 17)
                        }

                        Spacer().frame(height: 10)
                        
                        HStack {
                            Spacer().frame(width: 20)
                            
                            TextEditor(text: $content)
                                .font(.custom("HelveticaNeue", size: 16))
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            
                            Spacer().frame(width: 20)
                        }
                        
                        
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                )
                
                Spacer().frame(width: 25)
            }
            
            Spacer().frame(height: 21)
            
            HStack {
                Spacer().frame(width: 25)
                
                Button("다 썼어!", action: {
                    
                })
                .frame(maxWidth: .infinity, maxHeight: 54)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                
                Spacer().frame(width: 25)
            }
            
            Spacer().frame(height: 20)
        }
        
    }
}

struct FeelingNoteView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingNoteView()
    }
}
