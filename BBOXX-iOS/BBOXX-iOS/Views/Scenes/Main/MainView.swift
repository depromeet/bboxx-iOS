import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    @State var showGrowthView = false
    private let today = Date()
    private let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BboxxBackgroundColor")
                    .ignoresSafeArea()
                Image(ImageAsset.main_background)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                
                    .padding(.bottom, -35)
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        
                        Button {
                            // move to next page
                        } label: {
                            Image(ImageAsset.profileIcon)
                                .renderingMode(.template)
                                .resizable()
                                .foregroundColor(Color("BboxxTextColor").opacity(0.7))
                                .frame(width: 24, height: 24)
                        }
                        .padding(.top, 16)
                        .padding(.trailing, 16)
                    }
                    
                    
                    Text("\(today, formatter: dateformat)")
                        .font(.custom("Pretendard-Medium", size: 16))
                        .foregroundColor(Color("BboxxTextColor"))
                        
                        .padding(.top, 26)
                        .padding(.leading, 24)
                    
                    Text("\(viewModel.nickName)야! \n오늘도 좋은 하루보내🌼")
                        .font(.custom("Pretendard-SemiBold", size: 26))
                        .foregroundColor(Color("BboxxGrayColor"))

                        .padding(.top, 10)
                        .padding(.leading, 24)

                    Spacer()
                    
                    HStack(spacing: 14) {
                        NavigationLink(destination: MainEmptySelectionView().navigationBarHidden(true)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20.0)
                                    .foregroundColor(Color("main_button_background_color"))
                                VStack {
                                    Image(ImageAsset.emptyingIcon)
                                        .resizable()
                                        .frame(width: 53, height: 53)
                                    
                                    Text("비우기")
                                        .font(.custom("Pretendard-Medium", size: 16))
                                        .foregroundColor(.white)
                                    
                                }.padding(10.0)
                            }
                        }
                        .frame(width: 157, height: 110)
                        
                        NavigationLink(destination: NotificationListView().navigationBarHidden(true)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20.0)
                                    .foregroundColor(Color("main_button_background_color"))
                                VStack {
                                    Image(ImageAsset.timeMachineIcon)
                                        .resizable()
                                        .frame(width: 53, height: 53)
                                    
                                    Text("타임머신")
                                        .font(.custom("Pretendard-Medium", size: 16))
                                        .foregroundColor(.white)
                                    
                                }.padding(10.0)
                            }
                        }
                        .frame(width: 157, height: 110)
                    }
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            self.showGrowthView.toggle()
                        } label: {
                            Image(ImageAsset.main_down)
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .fullScreenCover(isPresented: $showGrowthView){
                            GrowthNoteCollectionView()
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 34)
                    .padding(.bottom, 10)
                }
            }.navigationBarHidden(true)

            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.height < 0 {
                                self.showGrowthView.toggle()
                            }
                        }))
            .fullScreenCover(isPresented: $showGrowthView){
                GrowthNoteCollectionView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
