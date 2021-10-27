import SwiftUI

struct GrowthNoteCollectionView: View {
    
    var growthNoteList: [GrowthNote] = [
        GrowthNote(date: "2021년 10월", title: "첫 회고록 쓰기", content: "지난 두 달간 써온 회고일기를 오늘 다시 읽어보았다. 얼핏 일기와 비슷해보이긴 하지만 조금 더 객관적이고 디테일하다는 측면에서 확연히 다르다. 나의 복잡다단한 감정을 쏟아내는 내면일기가 아니라, 명확한 질문을 두고 ‘나’ 라는 청자에게 쓰는 외면일기에 가깝다. 내가 무엇을 잘했고 부족했는지, 다음 단계로 나가기 위해서는 어떻게 해야하는지. 몇 주간의 기록을 쭉 훑어보니, 내가 일과 삶에 어떤 방향성을 지니고 싶어하는지가 보이고, 그러기 위해 노력하는 모습도 보여서 뿌듯했다."),
        GrowthNote(date: "2021년 10월", title: "첫 회고록 쓰기", content: "지난 두 달간 써온 회고일기를 오늘 다시 읽어보았다. 얼핏 일기와 비슷해보이긴 하지만 조금 더 객관적이고 디테일하다는 측면에서 확연히 다르다. 나의 복잡다단한 감정을 쏟아내는 내면일기가 아니라, 명확한 질문을 두고 ‘나’ 라는 청자에게 쓰는 외면일기에 가깝다. 내가 무엇을 잘했고 부족했는지, 다음 단계로 나가기 위해서는 어떻게 해야하는지. 몇 주간의 기록을 쭉 훑어보니, 내가 일과 삶에 어떤 방향성을 지니고 싶어하는지가 보이고, 그러기 위해 노력하는 모습도 보여서 뿌듯했다."),
        GrowthNote(date: "2021년 10월", title: "첫 회고록 쓰기", content: "지난 두 달간 써온 회고일기를 오늘 다시 읽어보았다. 얼핏 일기와 비슷해보이긴 하지만 조금 더 객관적이고 디테일하다는 측면에서 확연히 다르다. 나의 복잡다단한 감정을 쏟아내는 내면일기가 아니라, 명확한 질문을 두고 ‘나’ 라는 청자에게 쓰는 외면일기에 가깝다. 내가 무엇을 잘했고 부족했는지, 다음 단계로 나가기 위해서는 어떻게 해야하는지. 몇 주간의 기록을 쭉 훑어보니, 내가 일과 삶에 어떤 방향성을 지니고 싶어하는지가 보이고, 그러기 위해 노력하는 모습도 보여서 뿌듯했다."),
    ]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 24) ?? .systemFont(ofSize: 24), .foregroundColor : UIColor.brown]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center) {
                    Button(action: {}, label: {
                        Image(ImageAsset.leftSmallIcon)
                            .frame(width: 24, height: 24)
                    })
                    
                    Text("2021년 10월")
                        .font(.custom("HelveticaNeue", size: 18))
                    
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    
                    Button(action: {}, label: {
                        Image(ImageAsset.rightSmallIcon)
                            .frame(width: 24, height: 24)
                    })
                }
                .padding(.top, 20)
                
                if self.growthNoteList.count == 0 {
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
                            ForEach(growthNoteList, id: \.id) { growthNote in
                                GrowthNoteCell(date: growthNote.date, title: growthNote.title, content: growthNote.content)
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
