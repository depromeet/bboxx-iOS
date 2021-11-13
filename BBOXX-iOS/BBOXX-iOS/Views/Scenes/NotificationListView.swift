import SwiftUI

struct NotificationListView: View {
    
    @ObservedObject var viewModel = NotificationListViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(named: "BboxxBackgroundColor")
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BboxxBackgroundColor").ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(ImageAsset.backButton)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("BboxxTextColor").opacity(0.7))
                        })
                        .frame(
                            alignment: .topLeading
                        )
                        
                        Spacer()
                    }
                    .padding(.top, 16)
                    .padding(.leading, 16)
                    
                    HStack {
                        Text("나의 타임머신")
                            .font(.custom("Pretendard-Bold", size: 24))
                            .foregroundColor(Color("BboxxTextColor"))
                            
                            .padding(.top, 26)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    
                    if viewModel.notifications.count == 0 {
                        Spacer()
                        
                        Image(ImageAsset.emptyBoxIcon)
                            .frame(width: 160, height: 160)
                        
                        Text("아직 타임머신이 도착하지 않았어.")
                            .font(.custom("Pretendard-Bold", size: 18))
                            .foregroundColor(Color("BboxxTextColor"))
                            
                            .padding(.top, 20)
                            .padding(.bottom, 56)
                        
                        Spacer()

                    } else {
                        List() {
                            ForEach(viewModel.notifications, id: \.id) { noti in
                                ZStack {
                                    NavigationLink(destination:
                                                    FeelingNoteReviewView().navigationBarHidden(true)
                                    ) {
                                        EmptyView()
                                    }
                                    
                                    NotificationCell(notification: noti)
                                }
                            }
                            .onDelete(perform: deleteNotification)
                            .listRowBackground(Color("BboxxBackgroundColor"))
                            
                        }
                        .padding(.top, -10)
                        .padding(.leading, -10)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }.navigationBarHidden(true)
        }
    }
    
    func deleteNotification(at offsets: IndexSet) {
        if let first = offsets.first {
            viewModel.notifications.remove(at: first)
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}

