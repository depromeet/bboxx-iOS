import SwiftUI

struct FeelingNoteResultView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("부끄럼쟁이 딸기야,\n좀 후련해졌어?")
                .font(.custom("HelveticaNeue", size: 24))
                .bold()
            
            Text("너는 소중한 사람이니까 행복해지면 좋겠어.")
                .font(.custom("HelveticaNeue", size: 14))
                
                .padding(.top, 10)
            
            Image("")
                .frame(maxWidth: .infinity, maxHeight: 315, alignment: .center)
                .background(Color.yellow)
                
                .padding(.top, 20)
            
            HStack(spacing: 15) {
                Button(action: {}, label: {
                    Text("소리지르기")
                        .font(.custom("HelveticaNeue", size: 18))
                        .bold()
                        .foregroundColor(.black)
                })
                .frame(maxWidth: .infinity, minHeight: 56)
                .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 2)
                )
                
                Button(action: {}, label: {
                    Text("홈으로")
                        .font(.custom("HelveticaNeue", size: 18))
                        .bold()
                        .foregroundColor(.white)
                })
                .frame(maxWidth: .infinity, minHeight: 56)
                .background(Color.black)
                .cornerRadius(16)
            }
            .padding(.top, 75)
            .padding(.bottom, 30)
        }
        .frame(maxHeight: .infinity)

        .padding(.leading, 24)
        .padding(.trailing, 24)
        
        .background(Color("BboxxBackgroundColor").ignoresSafeArea())
    }
}

struct FeelingNoteResultView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingNoteResultView()
    }
}
