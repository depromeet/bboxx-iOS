import SwiftUI

struct GrowthNoteResultView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("네 감정을 담은 성장일기를 썼어")
                .font(.custom("HelveticaNeue", size: 24))
                .bold()

                .padding(.top, 34)
            
            Spacer()
            
            Image("")
                .frame(maxWidth: .infinity, maxHeight: 315)
                .background(Color.yellow)
                        
            Spacer()
            
            Button(action: {}, label: {
                Text("보러가기")
                    .font(.custom("HelveticaNeue", size: 18))
                    .bold()
                    .foregroundColor(.white)
            })
            .frame(maxWidth: .infinity, maxHeight: 56)
            .background(Color.black)
            .cornerRadius(16)
            
            .padding(.bottom, 30)
        }
        .padding(.leading, 24)
        .padding(.trailing, 24)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BboxxBackgroundColor").ignoresSafeArea())
    }
}

struct GrowthNoteResultView_Previews: PreviewProvider {
    static var previews: some View {
        GrowthNoteResultView()
    }
}
