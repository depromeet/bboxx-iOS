import SwiftUI

struct Tag: Identifiable, Hashable {
    
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
    var isSelected: Bool = false
}

// Select Tags in Growth Note 
struct TagList {
    let tags = [
    Tag(text: "나 왜그랬지"),
    Tag(text: "지금은 행복해🥰"),
    Tag(text: "나 열심히살았네"),
    Tag(text: "이불킥 각"),
    
    Tag(text: "욕나온다"),
    Tag(text: "아직도 열받아🤬"),
    Tag(text: "개웃겨"),
    Tag(text: "해탈😇"),
    Tag(text: "노력중"),
    
    Tag(text: "내 맘이 단단해졌어💪"),
    Tag(text: "할많하않"),
    Tag(text: "미쳤다"),
    Tag(text: "내 과거 안녕👋"),
    
    Tag(text: "ㅋ.."),
    Tag(text: "똥밟았네💩"),
    Tag(text: "별일 아니었어"),
    Tag(text: "생각하고싶지않아😶"),
    
    
    Tag(text: "이젠 괜찮아"),
    Tag(text: "오히려 좋아"),
    Tag(text: "머리터질듯🤯"),
    Tag(text: "속이 뻥 뚫린듯"),
    
    ]
}

