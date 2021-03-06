import SwiftUI

struct NotificationListView: View {
    
    @ObservedObject var viewModel = NotificationListViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var tag: Int? = 0
    @State var feelingNoteId: Int? = 0
    
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
                            .resizable()
                            .frame(width: 200, height: 200)
                        
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
                                                    FeelingNoteReviewView(feelingNote: viewModel.feelingNote).navigationBarHidden(true),
                                                   tag: 1,
                                                   selection: self.$tag
                                    ) {
                                        EmptyView()
                                    }
                                    
                                    NotificationCell(notification: noti)
                                        .onTapGesture {
                                            viewModel.getFeelingNote(feelingNoteId: noti.emotionDiaryId) {
                                                self.tag = 1
                                            }
                                        }
                                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                                    .onEnded({ value in
                                                        if value.translation.width < 0 {
                                                            self.feelingNoteId = noti.emotionDiaryId
                                                        }
                                                    }))
                                    
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
            viewModel.deleteFeelingNote(feelingNoteId: self.feelingNoteId ?? 0)
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}

