import SwiftUI

struct FeelingNoteResultView: View {
    
    @ObservedObject var viewModel = FeelingNoteResultViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    
                    NavigationLink(destination:
                                    MainView()
                                    .navigationBarHidden(true)) {
                        Image(ImageAsset.closeButton)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("BboxxGrayColor"))
                            .frame(
                                alignment: .topTrailing
                            )
                            
                            .padding(.top, 16)
                            .padding(.trailing, -8)
                    }
                }
                
                Spacer()
                
                Text("\(viewModel.nickName)야,\n좀 후련해졌어?")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundColor(Color("BboxxGrayColor"))
                
                    .padding(.top, 19)
                
                Text("너는 소중한 사람이니까 행복해지면 좋겠어.")
                    .font(.custom("Pretendard-Regular", size: 14))
                    .foregroundColor(Color("BboxxGrayColor"))
                    .opacity(0.7)
                    
                    .padding(.top, 10)
                
                HStack {
                    Spacer()
                    
                    Image(ImageAsset.hugIcon)
                        .resizable()
                        .frame(maxWidth: 240, maxHeight: 240, alignment: .center)
                    
                    Spacer()
                }
                .padding(.top, 20)
                
                Spacer()
                
                Image(ImageAsset.toolTip)
                    .frame(maxWidth: 147, maxHeight: 61)
                    
                    .padding(.top, 20)
                    .padding(.leading, 5)
                    .padding(.bottom, -15)
                
                
                HStack(spacing: 15) {
                    NavigationLink(destination:
                                    DecibelMeasurementView()
                                    .navigationBarHidden(true)) {
                        Text("소리지르기")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(Color("BboxxGrayColor").opacity(0.85))
                            .frame(maxWidth: .infinity, minHeight: 56)
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color("BboxxGrayColor").opacity(0.85), lineWidth: 2)
                            )
                    }
                    
                    NavigationLink(destination:
                                    MainView()
                                    .navigationBarHidden(true)) {
                        Text("홈으로")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 56)
                            .background(Color("BboxxGrayColor"))
                            .cornerRadius(16)
                    }
                }
                .padding(.bottom, 30)
            }
            .frame(maxHeight: .infinity)
            
            .padding(.leading, 24)
            .padding(.trailing, 24)
            
            .background(Color("BboxxBackgroundColor").ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
}

struct FeelingNoteResultView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingNoteResultView()
    }
}
