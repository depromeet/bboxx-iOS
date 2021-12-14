import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    @Environment(\.presentationMode) var presentationMode
        
    var body: some View {
        ZStack {
            Color("BboxxGrayColor")
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(ImageAsset.backButton)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("BboxxBackgroundColor").opacity(0.7))
                        })
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Text("나의 닉네임")
                        .font(.custom("Pretendard-Medium", size: 12))
                        .foregroundColor(Color("BboxxBackgroundColor"))
                        
                        .padding(.leading, 24)
                    
                    Text(viewModel.nickname)
                        .font(.custom("Pretendard-Bold", size: 28))
                        .foregroundColor(.white)
                        
                        .padding(.top, 5)
                        .padding(.leading, 24)
                        .padding(.bottom, 24)
                }
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height/4)
                
                .background(Color("BboxxGrayColor"))
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("푸시알림")
                                .font(.custom("Pretendard-Bold", size: 18))
                                .foregroundColor(Color("BboxxGrayColor"))
                                
                                .padding(.top, 24)
                            
                            Text("알림을 켜면 이전 감정을 받아볼 수 있어")
                                .font(.custom("Pretendard-Regular", size: 12))
                                .foregroundColor(Color("BboxxGrayColor").opacity(0.4))
                            
                                .padding(.top, 6)
                        }
                        
                        Spacer()
                                                
                        Toggle("", isOn: $viewModel.notiBinding)
                            .toggleStyle(SwitchToggleStyle(tint: Color.black))
                            .frame(width: 80, height: 80)
                            .onChange(of: viewModel.notiBinding, perform: { value in
                                viewModel.toggleSwitch()
                            })
                            
                            .padding(.trailing, 24)

                    }
                    
                    Divider()
                        .padding(.top, 24)
                        .padding(.trailing, 24)
                    
                    Text("앱 정보")
                        .font(.custom("Pretendard-Medium", size: 14))
                        .foregroundColor(Color("BboxxGrayColor").opacity(0.6))
                        
                        .padding(.top, 24)
                    
                    HStack {
                        Text("앱 버전 정보")
                            .font(.custom("Pretendard-Medium", size: 16))
                            .foregroundColor(Color("BboxxGrayColor"))
                        
                        Spacer()
                        
                        Text("ver. 1.0.0")
                            .font(.custom("Pretendard-Medium", size: 14))
                            .foregroundColor(Color("BboxxGrayColor").opacity(0.4))
                        
                            .padding(.trailing, 24)

                    }
                    .padding(.top, 14)
                    
                }
                .padding(.leading, 24)
                
                Spacer()
                
            }.navigationBarHidden(true)
            
            .background(Color("BboxxBackgroundColor"))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
