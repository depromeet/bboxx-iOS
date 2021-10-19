import SwiftUI

struct NotificationCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("2021. 10. 16.")
                    .font(.custom("HelveticaNeue", size: 14))
                
                    .padding(.top, 18)
                
                Text("1일 전")
                    .font(.custom("HelveticaNeue", size: 12))
                
                    .padding(.top, 18)
                
                Spacer()
                
                Button(action: {
                    // 클릭 시 셀 삭제
                }, label: {
                    Text("X")
                        .font(.custom("HelveticaNeue", size: 14))
                })
                .padding(.trailing, 10)
            }
            .padding(.leading, 18)
            
            Text("자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래?")
                .font(.custom("HelveticaNeue", size: 16))

                .padding(.top, 10)
                .padding(.leading, 18)
                .padding(.trailing, 18)
                .padding(.bottom, 18)
        }
        .background(Color.yellow)
        .cornerRadius(10)
    }
}
