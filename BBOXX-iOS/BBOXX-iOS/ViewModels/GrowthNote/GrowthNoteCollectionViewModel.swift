import SwiftUI

class GrowthNoteCollectionViewModel: ObservableObject {
        
    // dummy data
    var growthNoteList: [GrowthNote] = [
        GrowthNote(date: "2021년 10월", title: "첫 회고록 쓰기", content: "지난 두 달간 써온 회고일기를 오늘 다시 읽어보았다. 얼핏 일기와 비슷해보이긴 하지만 조금 더 객관적이고 디테일하다는 측면에서 확연히 다르다. 나의 복잡다단한 감정을 쏟아내는 내면일기가 아니라, 명확한 질문을 두고 ‘나’ 라는 청자에게 쓰는 외면일기에 가깝다. 내가 무엇을 잘했고 부족했는지, 다음 단계로 나가기 위해서는 어떻게 해야하는지. 몇 주간의 기록을 쭉 훑어보니, 내가 일과 삶에 어떤 방향성을 지니고 싶어하는지가 보이고, 그러기 위해 노력하는 모습도 보여서 뿌듯했다.", feelings: ["나 왜그랬지", "이불킥 각", "개웃겨", "용기파워", "난 너무 멋져"]),
        GrowthNote(date: "2021년 10월", title: "첫 회고록 쓰기", content: "지난 두 달간 써온 회고일기를 오늘 다시 읽어보았다. 얼핏 일기와 비슷해보이긴 하지만 조금 더 객관적이고 디테일하다는 측면에서 확연히 다르다. 나의 복잡다단한 감정을 쏟아내는 내면일기가 아니라, 명확한 질문을 두고 ‘나’ 라는 청자에게 쓰는 외면일기에 가깝다. 내가 무엇을 잘했고 부족했는지, 다음 단계로 나가기 위해서는 어떻게 해야하는지. 몇 주간의 기록을 쭉 훑어보니, 내가 일과 삶에 어떤 방향성을 지니고 싶어하는지가 보이고, 그러기 위해 노력하는 모습도 보여서 뿌듯했다.", feelings: ["나 왜그랬지", "이불킥 각", "개웃겨", "용기파워", "난 너무 멋져"]),
        GrowthNote(date: "2021년 10월", title: "첫 회고록 쓰기", content: "지난 두 달간 써온 회고일기를 오늘 다시 읽어보았다. 얼핏 일기와 비슷해보이긴 하지만 조금 더 객관적이고 디테일하다는 측면에서 확연히 다르다. 나의 복잡다단한 감정을 쏟아내는 내면일기가 아니라, 명확한 질문을 두고 ‘나’ 라는 청자에게 쓰는 외면일기에 가깝다. 내가 무엇을 잘했고 부족했는지, 다음 단계로 나가기 위해서는 어떻게 해야하는지. 몇 주간의 기록을 쭉 훑어보니, 내가 일과 삶에 어떤 방향성을 지니고 싶어하는지가 보이고, 그러기 위해 노력하는 모습도 보여서 뿌듯했다.", feelings: ["나 왜그랬지", "이불킥 각", "개웃겨", "용기파워", "난 너무 멋져"]),
    ]
    
    let backgroundColors: [Color] = [
        Color(red: 164 / 255, green: 93 / 255, blue: 99 / 255),
        Color(red: 198 / 255, green: 129 / 255, blue: 91 / 255),
        Color(red: 203 / 255, green: 163 / 255, blue: 103 / 255),
        Color(red: 105 / 255, green: 120 / 255, blue: 85 / 255),
        Color(red: 91 / 255, green: 122 / 255, blue: 107 / 255),
        Color(red: 99 / 255, green: 124 / 255, blue: 148 / 255),
        Color(red: 80 / 255, green: 84 / 255, blue: 116 / 255),
        Color(red: 119 / 255, green: 97 / 255, blue: 130 / 255),
        Color(red: 95 / 255, green: 91 / 255, blue: 109 / 255),
        Color(red: 151 / 255, green: 138 / 255, blue: 123 / 255),
        Color(red: 94 / 255, green: 78 / 255, blue: 65 / 255),
    ]
    
    func setBackgroundColor(_ index: Int) -> Color {
        return backgroundColors[index % 11]
    }
    
    func leftButtonDidTap() {
        // 이전 달로 이동
    }
    
    func rightButtonDidTap() {
        // 다음 달로 이동
    }
}
