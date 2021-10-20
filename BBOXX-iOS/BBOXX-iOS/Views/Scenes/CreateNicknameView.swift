import SwiftUI

struct CreateNicknameView: View {
    var body: some View {
        VStack {
            Text("너를 뭐라고 부를까?")
                .font(.custom("HelveticaNeue", size: 24))
            
                .padding(.top, 115)

            Text("나중에 프로필에서 다시 바꿀 수 있어")
                .font(.custom("HelveticaNeue", size: 14))
            
                .padding(.top, 11)
            
            Text("사랑스러운딸기")
                .font(.custom("HelveticaNeue", size: 20))
                .multilineTextAlignment(.center)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 2)
                )
            
                .padding(.top, 50)
            
            Button(action: {
                // 랜덤 생성된 닉네임 서버에서 받아오기
            }) {
                Image("redo")
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 6)
                
                Text("다시 고를래")
                    .font(.custom("HelveticaNeue", size: 16))
            }
            .padding(.top, 20)
            
            Spacer()
            
            Button(action: {}, label: {
                Text("마음에 들어")
                    .font(.custom("HelveticaNeue", size: 18))
                    .foregroundColor(.white)
            })
            .frame(maxWidth: .infinity, maxHeight: 56)
            .background(Color.black)
            .cornerRadius(16)
            
            .padding(.bottom, 30)
        }
        .padding(.leading, 24)
        .padding(.trailing, 24)
    }
}

struct CreateNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNicknameView()
    }
}
