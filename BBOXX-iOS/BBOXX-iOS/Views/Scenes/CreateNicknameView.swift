import SwiftUI

struct CreateNicknameView: View {
    
    @ObservedObject var viewModel = CreateNicknameViewModel()
    
    var body: some View {
        VStack {
            Text("너를 뭐라고 부를까?")
                .font(.custom("HelveticaNeue", size: 24))
                .bold()
            
                .padding(.top, 115)

            Text("나중에 프로필에서 다시 바꿀 수 있어")
                .font(.custom("HelveticaNeue", size: 14))
            
                .padding(.top, 11)
            
            Text(viewModel.nickname)
                .font(.custom("HelveticaNeue", size: 20))
                .bold()
                .multilineTextAlignment(.center)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 2)
                )
            
                .padding(.top, 50)
            
            Button(action: {
                viewModel.redoButtonDidTap()
            }) {
                Image("redo")
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 6)
                
                Text("다시 고르기")
                    .font(.custom("HelveticaNeue", size: 16))
                    .bold()
                    .foregroundColor(.black)
            }
            .padding(.top, 20)
            
            Spacer()
            
            Button(action: {}, label: {
                Text("마음에 들어")
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
    }
}

struct CreateNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNicknameView()
    }
}
