import SwiftUI

struct FeelingNoteResultView: View {
    
    @State private var tag: Int? = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("부끄럼쟁이 딸기야,\n좀 후련해졌어?")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundColor(Color("BboxxGrayColor"))
                
                Text("너는 소중한 사람이니까 행복해지면 좋겠어.")
                    .font(.custom("Pretendard-Regular", size: 14))
                    .foregroundColor(Color("BboxxGrayColor"))
                    .opacity(0.7)
                    
                    .padding(.top, 10)
                
                Image(ImageAsset.hugIcon)
                    .frame(maxWidth: .infinity, maxHeight: 315, alignment: .center)
                    
                    .padding(.top, 20)
                
                Image(ImageAsset.toolTip)
                    .frame(maxWidth: 147, maxHeight: 61)
                    
                    .padding(.top, 20)
                    .padding(.leading, 5)
                    .padding(.bottom, -15)
                
                NavigationLink(destination:
                                DecibelMeasurementView()
                                .navigationBarBackButtonHidden(false)
                                .navigationBarHidden(true)
                               , tag: 1, selection: self.$tag) {
                    EmptyView()
                }
                
                NavigationLink(destination:
                                MainView()
                                .navigationBarBackButtonHidden(false)
                                .navigationBarHidden(true)
                               , tag: 2, selection: self.$tag) {
                    EmptyView()
                }
                
                HStack(spacing: 15) {
                    Button(action: {
                        self.tag = 1
                    }, label: {
                        Text("소리지르기")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(Color("BboxxGrayColor").opacity(0.85))
                    })
                    .frame(maxWidth: .infinity, minHeight: 56)
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("BboxxGrayColor").opacity(0.85), lineWidth: 2)
                    )
                    
                    Button(action: {
                        self.tag = 2
                    }, label: {
                        Text("홈으로")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(.white)
                    })
                    .frame(maxWidth: .infinity, minHeight: 56)
                    .background(Color("BboxxGrayColor"))
                    .cornerRadius(16)
                }
                .padding(.bottom, 30)
            }
            .frame(maxHeight: .infinity)
            
            .padding(.leading, 24)
            .padding(.trailing, 24)
            
            .background(Color("BboxxBackgroundColor").ignoresSafeArea())
        }
    }
}
