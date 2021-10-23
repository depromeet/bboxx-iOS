import SwiftUI

struct NotificationCell: View {
        
    let notification: Notification
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("10. 23.")
                    .font(.custom("HelveticaNeue", size: 14))
                
                    .padding(.top, 16)
                
                Text("n일 전")
                    .font(.custom("HelveticaNeue", size: 12))
                
                    .padding(.top, 16)
                
                Spacer()
            }
            .padding(.leading, 18)
            
            Text("자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래? 자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래")
                .font(.custom("HelveticaNeue", size: 16))
                .bold()
                .lineLimit(2)

                .padding(.top, 8)
                .padding(.leading, 18)
                .padding(.trailing, 18)
                .padding(.bottom, 20)
        }
        .background(Color.yellow)
        .cornerRadius(10)
    }
}
