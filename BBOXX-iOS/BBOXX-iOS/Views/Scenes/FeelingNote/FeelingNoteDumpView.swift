import SwiftUI

struct FeelingNoteDumpView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("네 힘든 감정을 정리해볼래?")
                .font(.custom("Pretendard-Bold", size: 24))
                .foregroundColor(Color("BboxxGrayColor"))

                .padding(.top, 10)
                .padding(.leading, 24)
            
            ScrollView() {
                LazyVStack(alignment: .leading) {
                    HStack {
                        Text("오늘")
                            .font(.custom("Pretendard-Medium", size: 28))
                            .foregroundColor(Color("BboxxTextColor"))
                        
                        Text("학업문제")
                            .font(.custom("Pretendard-Bold", size: 28))
                            .foregroundColor(Color("BboxxGrayColor"))

                            .padding(.top, 3.57)
                        
                        Text("로 힘들었어.")
                            .font(.custom("Pretendard-Medium", size: 28))
                            .foregroundColor(Color("BboxxTextColor"))
                    }
                    .padding(.top, 30)
                    
                    Text("아 정말 힘들다")
                        .font(.custom("Pretendard-Bold", size: 20))
                        .foregroundColor(Color("BboxxTextColor"))

                        .padding(.top, 27)
                    
                    Text("오늘 너무 힘들어.. 끝나고 중요한 약속이 있었는데 갑자기 일이 생겼다. 미안하다고 하고 허겁지겁 일을 끝내가려는데 갑자기 약속도 취소되고.. 왜이렇게 되는 일이 없냐 ㅠ... 진짜 짜증나오늘 너무 힘들어.. 끝나고 중요한 약속이 있었는데 갑자기 일이 생겼다. 미안하다고 하고 허겁지겁 일을 끝내가려는데 갑자기 약속도 취소되고.. 왜이렇게 되는 일이 없냐 ㅠ... 진짜 짜증나오늘 너무 힘들어.. 끝나고 중요한 약속이 있었는데 갑자기 일이 생겼다. ")
                        .font(.custom("Pretendard-Regular", size: 16))
                        .foregroundColor(Color("BboxxGrayColor"))
                        
                        .padding(.top, 10)
                    
                    Text("내 감정은..")
                        .font(.custom("Pretendard-Bold", size: 20))
                        .foregroundColor(Color("BboxxTextColor"))
                        
                        .padding(.top, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20) {
                            ForEach(0..<10) { index in
                                Image("")
                                    .frame(width: 80, height: 80)
                                    .background(Color.green)
                            }
                        }
                    }
                    .frame(height: 80)
                    
                    .padding(.top, 40)
                    .padding(.trailing, -24)
                        
                    Button(action: {}, label: {
                        Text("버릴래")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(.white)
                    })
                    .frame(maxWidth: .infinity, minHeight: 56)
                    .background(Color("BboxxGrayColor"))
                    .cornerRadius(16)
                    
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                }
                .padding(.leading, 24)
                .padding(.trailing, 24)
            }
            .background(Color.white)
            .cornerRadius(24)
            
            .padding(.top, 20)
            
        }
        .background(Color("BboxxBackgroundColor").ignoresSafeArea())
    }
}
