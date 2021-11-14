import SwiftUI

struct GrowthNoteCollectionView: View {
    
    @ObservedObject var viewModel = GrowthNoteCollectionViewModel()
    
    @State var showMainView = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()

                    Button(action: {
                        
                    }, label: {
                        Image(ImageAsset.profileIcon)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("BboxxTextColor").opacity(0.7))
                    })
                    .padding(.top, 16)
                    .padding(.trailing, 24)
                }
                                
                HStack {
                    Text("성장일기")
                        .font(.custom("Pretendard-Bold", size: 24))
                        .foregroundColor(Color("BboxxTextColor"))
                        
                        .padding(.leading, 24)
                    
                    Spacer()
                }
                
                HStack(alignment: .center) {
                    Button(action: {
                        self.viewModel.leftButtonDidTap()
                    }, label: {
                        Image(ImageAsset.leftSmallIcon)
                            .frame(width: 24, height: 24)
                    })
                    
                    Text(viewModel.dateString)
                        .font(.custom("Pretendard-SemiBold", size: 18))
                        .foregroundColor(Color("BboxxTextColor"))
                        
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    
                    Button(action: {
                        self.viewModel.rightButtonDidTap()
                    }, label: {
                        Image(ImageAsset.rightSmallIcon)
                            .frame(width: 24, height: 24)
                    })
                }
                .padding(.top, 20)
                
                if self.viewModel.growthNoteList.count == 0 {
                    VStack(alignment: .center) {
                        
                        Image(ImageAsset.emptyBoxIcon)
                            .resizable()
                            .frame(width: 160, height: 160, alignment: .center)
                        
                        Text("아직 쓴 글이 없어.\n네가 얼만큼 성장했는지 글로 써봐.")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(Color("BboxxTextColor"))
                            .multilineTextAlignment(.center)
                            
                            .padding(.top, 20)
                        
                        NavigationLink(destination:
                                        NotificationListView().navigationBarHidden(true)) {
                            Text("이전 감정 보러가기")
                                .font(.custom("Pretendard-SemiBold", size: 16))
                                .foregroundColor(.white)
                                .frame(maxWidth: 166, maxHeight: 46)
                                .background(Color("BboxxGrayColor"))
                                .cornerRadius(14)
                                
                                .padding(.top, 20)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(Array(viewModel.growthNoteList.enumerated()), id: \.offset) { index, growthNote in
                                NavigationLink(destination:
                                                GrowthNoteDetailView(growthNote: growthNote, backgroundColor: viewModel.setBackgroundColor(index)).navigationBarHidden(true)) {
                                    GrowthNoteCell(growthNote: growthNote,
                                                   backgroundColor: viewModel.setBackgroundColor(index))
                                }
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.leading, 30)
                    .padding(.bottom, 41)
                    
                    Spacer()

                }
                
            }
            .navigationBarHidden(true)
            
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BboxxBackgroundColor").ignoresSafeArea())
            
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.height > 0 {
                                self.showMainView.toggle()
                            }
                        }))
            .fullScreenCover(isPresented: $showMainView){
                MainView()
            }
        }
    }
}

struct GrowthNoteCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        GrowthNoteCollectionView()
    }
}
