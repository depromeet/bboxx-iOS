import SwiftUI

struct NotificationListView: View {
    
    @ObservedObject var viewModel = NotificationListViewModel()
    
    @State var notificationList: [Notification] = [
        Notification(currentDate: "10. 23.", date: "n일 전", content: "자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래? 자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래"),
        Notification(currentDate: "10. 23.", date: "n일 전", content: "자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래? 자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래"),
        Notification(currentDate: "10. 23.", date: "n일 전", content: "자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래? 자이언트펭귄! 한달 전(2021년 10월 20일)에 쓴 일기가 도착했어 📬 한번 읽어볼래")
    ]
    @State var tag: Int? = 0
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Pretendard-Bold", size: 24) ?? .systemFont(ofSize: 24), .foregroundColor : UIColor(named: "BboxxTextColor") ?? .black]
        UITableView.appearance().backgroundColor = UIColor(named: "BboxxBackgroundColor")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if notificationList.count == 0 {
                    Image(ImageAsset.emptyBoxIcon)
                        .frame(width: 160, height: 160)
                    
                    Text("네게 온 알림이 아직 없어.")
                        .font(.custom("Pretendard-Bold", size: 18))
                        .foregroundColor(Color("BboxxTextColor"))
                        
                        .padding(.top, 20)
                        .padding(.bottom, 56)
                } else {
                    NavigationLink(destination:
                                    FeelingNoteReviewView().navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(false)
                                    .navigationBarHidden(true)
                                   , tag: 1, selection: self.$tag) {
                        EmptyView()
                    }
                    
                    List() {
                        ForEach(self.notificationList, id: \.id) { noti in
                            NotificationCell(notification: noti)
                                .onTapGesture {
                                    self.tag = 1
                                }
                        }
                        .onDelete(perform: deleteNotification)
                        .listRowBackground(Color("BboxxBackgroundColor"))
                    }
                }
                
            }.navigationTitle(Text("나의 타임머신"))
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BboxxBackgroundColor")).ignoresSafeArea()
        }
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

