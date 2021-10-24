import SwiftUI

struct NotificationListView: View {
    
    @ObservedObject var viewModel = NotificationListViewModel()
    
    @State var notificationList: [Notification] = [
        Notification(currentDate: "10. 23.", date: "n일 전", content: "자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래? 자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래"),
        Notification(currentDate: "10. 23.", date: "n일 전", content: "자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래? 자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래"),
        Notification(currentDate: "10. 23.", date: "n일 전", content: "자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래? 자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래")
    ]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 24) ?? .systemFont(ofSize: 24), .foregroundColor : UIColor.brown]
    }
    
    var body: some View {
        NavigationView {
            if notificationList.count == 0 {
                VStack() {
                    Image("emptyBox")
                        .frame(width: 160, height: 160)
                    
                    Text("네게 온 알림이 아직 없어.")
                        .font(.custom("HelveticaNeue", size: 18))
                        .bold()
                        
                        .padding(.top, 20)
                        .padding(.bottom, 56)
                                        
                }.navigationTitle(Text("나의 타임머신"))
                
            } else {
                List() {
                    ForEach(self.notificationList, id: \.id) { noti in
                        NotificationCell(notification: noti)
                    }
                    .onDelete(perform: deleteNotification)
                }.navigationTitle(Text("나의 타임머신"))
            }
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
    
    func deleteNotification(at offsets: IndexSet) {
        if let first = offsets.first {
            notificationList.remove(at: first)
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}
