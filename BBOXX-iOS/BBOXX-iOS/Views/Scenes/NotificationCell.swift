import SwiftUI

struct NotificationCell: View {
        
    let notification: Notification
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(notification.createdAt)
                    .font(.custom("Pretendard-Medium", size: 14))
                    .foregroundColor(Color("BboxxGrayColor").opacity(0.6))
                    
                    .padding(.top, 16)
                
                Text("n일 전")
                    .font(.custom("Pretendard-Regular", size: 12))
                    .foregroundColor(Color("BboxxGrayColor").opacity(0.4))

                    .padding(.top, 16)
                
                Spacer()
            }
            .padding(.leading, 18)
            
            Text(notification.message + notification.title)
                .font(.custom("Pretendard-Medium", size: 16))
                .foregroundColor(Color("BboxxTextColor"))
                .lineLimit(2)

                .padding(.top, 8)
                .padding(.leading, 18)
                .padding(.trailing, 18)
                .padding(.bottom, 20)
        }
        .background(Color(red: 234 / 255.0, green: 224 / 255.0, blue: 219 / 255.0))
        .cornerRadius(14)
    }
}
