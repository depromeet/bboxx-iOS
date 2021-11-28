import SwiftUI
import SwiftKeychainWrapper

struct CreateNicknameView: View {
    
    @ObservedObject var viewModel = CreateNicknameViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BboxxBackgroundColor").ignoresSafeArea()

                VStack {
                    Text("너를 뭐라고 부를까?")
                        .font(.custom("Pretendard-Bold", size: 24))
                        .foregroundColor(.black)
                        
                        .padding(.top, 115)
                    
                    Text("나중에 프로필에서 다시 바꿀 수 있어")
                        .font(.custom("Pretendard-Regular", size: 14))
                        .foregroundColor(Color("BboxxGrayColor").opacity(0.6))
                        
                        .padding(.top, 11)
                    
                    Text(viewModel.nickname)
                        .font(.custom("Pretendard-SemiBold", size: 20))
                        .foregroundColor(Color("BboxxTextColor"))
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color("BboxxTextColor"), lineWidth: 2)
                        )
                        
                        .padding(.top, 50)
                    
                    Button(action: {
                        viewModel.redoButtonDidTap()
                    }) {
                        Image(ImageAsset.redoButton)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("BboxxGrayColor"))
                            
                            .padding(.trailing, 6)
                        
                        Text("다시 고르기")
                            .font(.custom("Pretendard-Bold", size: 16))
                            .foregroundColor(Color("BboxxGrayColor").opacity(0.6))
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    NavigationLink(destination:
                                    MainView()
                                    .navigationBarHidden(true)
                                   , tag: 1, selection: self.$viewModel.tag) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        viewModel.signUp(KeychainWrapper.standard.string(forKey: "authData") ?? "",
                                         viewModel.nickname,
                                         UserDefaults.standard.string(forKey: "providerType") ?? "")
                    }, label: {
                        Text("마음에 들어")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(.white)
                    })
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .background(Color("BboxxTextColor"))
                    .cornerRadius(16)
                    
                    .padding(.bottom, 30)
                }
                .padding(.leading, 24)
                .padding(.trailing, 24)
                
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
}

struct CreateNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNicknameView()
    }
}
