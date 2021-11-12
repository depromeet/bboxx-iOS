import SwiftUI

struct DecibelMeasurementResultView: View {
    
    var decibel: Int = 0
    var title: String = ""
    var backgroundColor: Color = Color.white
    var decibelResultImage: String = ImageAsset.decibelResultImage1
    
    @Environment(\.presentationMode) var presentationMode

    init(decibel: Float, title: String, backgroundColor: Color, decibelResultImage: String) {
        self.decibel = Int(decibel)
        self.title = title
        self.backgroundColor = backgroundColor
        self.decibelResultImage = decibelResultImage
    }
    
    var body: some View {
        ZStack {
            Color(UIColor(backgroundColor)).ignoresSafeArea()
            
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
                            .foregroundColor(.white)
                        
                            .padding(.top, 16)
                            .padding(.trailing, -4)
                    }
                }
                
                Spacer()
                
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text("\(self.decibel)")
                        .font(.custom("Pretendard-SemiBold", size: 100))
                        .foregroundColor(.white)
                    
                    VStack {
                        Spacer()
                        
                        Text("dB")
                            .font(.custom("Pretendard-Medium", size: 28))
                            .foregroundColor(.white)
                    }
                    .padding(.leading, -10)
                }
                .frame(height: 90)
                
                .padding(.top, 24)
                
                HStack {
                    NavigationLink(destination:
                                    DecibelMeasurementView()
                                    .navigationBarHidden(true)) {
                        Image(ImageAsset.redoButton)
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            
                            .padding(.trailing, 7)
                        
                        Text("다시 해보기")
                            .font(.custom("Pretendard-SemiBold", size: 16))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 24)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image(decibelResultImage)
                        .resizable()
                        .frame(width: 199, height: 217)
                }
                .padding(.top, 11)
                
                HStack(spacing: 15) {
                    NavigationLink(destination: SelectCategoryView()
                                    .navigationBarHidden(true)) {
                        Text("감정일기 쓰기")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(Color("BboxxGrayColor").opacity(0.5))
                            .frame(maxWidth: .infinity, minHeight: 56)
                            .background(Color("BboxxBackgroundColor"))
                            .cornerRadius(16)
                    }
                    
                    Button(action: {}, label: {
                        Text("감정 공유하기")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(.white)
                    })
                    .frame(maxWidth: .infinity, minHeight: 56)
                    .background(Color("BboxxGrayColor"))
                    .cornerRadius(16)
                }
                .padding(.top, 30)
                .padding(.bottom, 30)
                
            }
            .padding(.leading, 24)
            .padding(.trailing, 24)
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
