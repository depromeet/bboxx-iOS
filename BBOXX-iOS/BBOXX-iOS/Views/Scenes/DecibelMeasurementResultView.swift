import SwiftUI

struct DecibelMeasurementResultView: View {
    
    var decibel: Int = 0
    var title: String = ""
    var backgroundColor: Color = Color.white
    
    init(decibel: Float, title: String, backgroundColor: Color) {
        self.decibel = Int(decibel)
        self.title = title
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 35)
                
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
                    Button(action: {
                    }) {
                        Image(ImageAsset.redoWhiteButton)
                            .frame(width: 20, height: 20)
                            
                            .padding(.trailing, 7)
                        
                        Text("다시 해보기")
                            .font(.custom("Pretendard-SemiBold", size: 16))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 24)
                
                //Spacer()
                
                HStack {
                    Spacer()
                    
                    Image("")
                        .frame(width: 199, height: 217)
                        .background(Color.gray)
                }
                .padding(.top, 11)
                
                HStack(spacing: 15) {
                    Button(action: {}, label: {
                        Text("감정일기 쓰기")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(Color("BboxxGrayColor").opacity(0.5))
                    })
                    .frame(maxWidth: .infinity, minHeight: 56)
                    .background(Color("BboxxBackgroundColor"))
                    .cornerRadius(16)
                    
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
            .background(backgroundColor).ignoresSafeArea()
    }
}
