import SwiftUI

struct GrowthNoteDetailView: View {
    var growthNote = GrowthNote(date: "2021년 10월", title: "첫 회고록 쓰기", content: "지난 두 달간 써온 회고일기를 오늘 다시 읽어보았다. 얼핏 일기와 비슷해보이긴 하지만 조금 더 객관적이고 디테일하다는 측면에서 확연히 다르다. 나의 복잡다단한 감정을 쏟아내는 내면일기가 아니라, 명확한 질문을 두고 ‘나’ 라는 청자에게 쓰는 외면일기에 가깝다. 내가 무엇을 잘했고 부족했는지, 다음 단계로 나가기 위해서는 어떻게 해야하는지. 몇 주간의 기록을 쭉 훑어보니, 내가 일과 삶에 어떤 방향성을 지니고 싶어하는지가 보이고, 그러기 위해 노력하는 모습도 보여서 뿌듯했다. 첫 회고록 쓰기 지난 두 달간 써온 회고일기를 오늘 다시 읽어보았다. 얼핏 일기와 비슷해보이긴 하지만 조금 더 객관적이고 디테일하다는 측면에서 확연히 다르다. 나의 복잡다단한 감정을 쏟아내는 내면일기가 아니라, 명확한 질문을 두고 ‘나’ 라는 청자에게 쓰는 외면일기에 가깝다. 내가 무엇을 잘했고 부족했는지, 다음 단계로 나가기 위해서는 어떻게 해야하는지. 몇 주간의 기록을 쭉 훑어보니, 내가 일과 삶에 어떤 방향성을 지니고 싶어하는지가 보이고, 그러기 위해 노력하는 모습도 보여서 뿌듯했다. ", feelings: ["나 왜그랬지", "이불킥 각", "개웃겨", "용기파워", "난 너무 멋져"])
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading) {
                Text(self.growthNote.date)
                    .font(.custom("HelveticaNeue", size: 12))
                
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                
                Text(self.growthNote.title)
                    .font(.custom("HelveticaNeue", size: 20))
                    .bold()
                    
                    .padding(.top, 10)
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                
                Text(self.growthNote.content)
                    .font(.custom("HelveticaNeue", size: 16))
                
                    .padding(.top, 10)
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                
                TagView(tags: self.growthNote.feelings)
                    .frame(height: 120)
                    
                    .padding(.top, 20)
                    .padding(.leading, 16)
                
                Spacer()
            }
        }
    }
}

struct GrowthNoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GrowthNoteDetailView()
    }
}
