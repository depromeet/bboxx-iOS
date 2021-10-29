import SwiftUI

struct GrowthNoteCollectionView: View {
    
    @ObservedObject var viewModel = GrowthNoteCollectionViewModel()
    
    @State var tag: Int? = 0

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Pretendard-Bold", size: 24) ?? .systemFont(ofSize: 24), .foregroundColor : UIColor(named: "BboxxTextColor") ?? .black]
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
                            .frame(width: 160, height: 160, alignment: .center)
                        
                        Text("아직 쓴 글이 없어.\n네가 얼만큼 성장했는지 글로 써봐.")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(Color("BboxxTextColor"))
                            .multilineTextAlignment(.center)
                        
                            .padding(.top, 20)

                        Button(action: {}, label: {
                            Text("이전 감정 보러가기")
                                .font(.custom("Pretendard-SemiBold", size: 16))
                                .foregroundColor(.white)
                        })
                        .frame(maxWidth: 166, maxHeight: 46)
                        .background(Color("BboxxGrayColor"))
                        .cornerRadius(14)
                        
                        .padding(.top, 20)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                } else {
                    NavigationLink(destination:
                                    GrowthNoteDetailView()
                                   , tag: 1, selection: self.$tag) {
                        EmptyView()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(self.viewModel.growthNoteList, id: \.id) { growthNote in
                                GrowthNoteCell(date: growthNote.date, title: growthNote.title, content: growthNote.content, feelings: growthNote.feelings)
                                    .onTapGesture {
                                        self.tag = 1
                                    }
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
