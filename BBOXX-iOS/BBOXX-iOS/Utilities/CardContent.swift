import SwiftUI

struct CardContent: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("그만쓰고싶어?")
                .font(.custom("HelveticaNeue", size: 28))
                
                .padding(.top, 40)
            
            Text("돌아가면 쓰던 글이 없어져")
                .font(.custom("HelveticaNeue", size: 16))
                
                .padding(.top, 8)
            
            Image("")
                .frame(width: 200, height: 200, alignment: .center)
                .background(Color.gray)
                
                .padding(.top, 20)
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("그만쓸래")
                        .font(.custom("HelveticaNeue", size: 18))
                        .foregroundColor(Color.black)
                })
                .frame(width: 156, height: 56, alignment: .center)
                
                Spacer().frame(width: 19)
                
                Button(action: {
                    
                }, label: {
                    Text("계속쓸래")
                        .font(.custom("HelveticaNeue", size: 18))
                        .foregroundColor(Color.white)
                })
                .frame(width: 156, height: 56, alignment: .center)
                .background(Color.black)
                .cornerRadius(16)
            }
            .padding(.top, 38)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 30)
        }
        
    }
}
