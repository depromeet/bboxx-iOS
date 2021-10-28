import SwiftUI

struct GrowthNoteCollectionView: View {
    
    @ObservedObject var viewModel = GrowthNoteCollectionViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 24) ?? .systemFont(ofSize: 24), .foregroundColor : UIColor.brown]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center) {
                    Button(action: {
                        self.viewModel.leftButtonDidTap()
                    }, label: {
                        Image(ImageAsset.leftSmallIcon)
                            .frame(width: 24, height: 24)
                    })
                    
                    Text("2021년 10월")
                        .font(.custom("HelveticaNeue", size: 18))
                    
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
                            .frame(width: 160, height: 160, alignment: .center)
                        
                        Text("아직 쓴 글이 없어.\n네가 얼만큼 성장했는지 글로 써봐.")
                            .font(.custom("HelveticaNeue", size: 18))
                            .multilineTextAlignment(.center)
                        
                            .padding(.top, 20)

                        Button(action: {}, label: {
                            Text("이전 감정 보러가기")
                                .font(.custom("HelveticaNeue", size: 16))
                                .foregroundColor(.white)
                        })
                        .frame(maxWidth: 166, maxHeight: 46)
                        .background(Color.black)
                        .cornerRadius(14)
                        
                        .padding(.top, 20)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(self.viewModel.growthNoteList, id: \.id) { growthNote in
                                GrowthNoteCell(date: growthNote.date, title: growthNote.title, content: growthNote.content, feelings: growthNote.feelings)
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.leading, 30)
                    .padding(.bottom, 41)
                }
                
            }.navigationTitle(Text("성장일기"))
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BboxxBackgroundColor").ignoresSafeArea())
        }
    }
}

struct GrowthNoteCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        GrowthNoteCollectionView()
    }
}
