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
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .bottom
                    )
                    .padding(.bottom, -60)
                VStack {
                    Button {
                        // move to next page
                    } label: {
                        Image(ImageAsset.profileIcon)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 30,
                        alignment: .topTrailing
                    )
                    .padding(.top, 50)
                    .padding(.trailing, 15)
                    Spacer()
                    Text("\(today, formatter: dateformat)")
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .topLeading)
                        .padding(.leading, 30)
                        .offset(y: 15)
                    Text("\(viewModel.nickName)야! \n오늘도 좋은 하루보내 🌼")
                        .font(.system(size: 30))
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding(.leading, 30)
                        .offset(y: 15)
                    Spacer()
                    HStack(spacing: 10) {
                        NavigationLink(destination: MainEmptySelectionView().navigationBarHidden(true)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 19.0)
                                    .foregroundColor(Color("main_button_background_color"))
                            VStack {
                                Image(ImageAsset.emptyingIcon)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    Text("비우기")
                                    .foregroundColor(.white)
                                }.padding(10.0)
                            }
                        }
                        .frame(width: 160, height: 80)
                        .padding(.trailing, 6)
                        NavigationLink(destination: NotificationListView().navigationBarHidden(true)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 19.0)
                                    .foregroundColor(Color("main_button_background_color"))
                            VStack {
                                Image(ImageAsset.timeMachineIcon)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    Text("타임머신")
                                    .foregroundColor(.white)
                                }.padding(10.0)
                            }
                        }
                        .frame(width: 160, height: 80)
                        .padding(.trailing, 6)
                    }
                    .padding(.bottom, 40)
                    Button {
                        self.showGrowthView.toggle()
                    } label: {
                        Image(ImageAsset.main_down)
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .fullScreenCover(isPresented: $showGrowthView){
                        GrowthNoteCollectionView()
                    }
                    .frame(width: 60, height: 60)
                    .padding(.trailing, 6)
                }
                .edgesIgnoringSafeArea(.all)
            }
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
