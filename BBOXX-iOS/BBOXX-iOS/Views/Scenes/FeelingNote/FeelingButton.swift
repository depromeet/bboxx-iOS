import SwiftUI

struct FeelingButton: View {
    
    @State var image: UIImage = UIImage()
    private let imageWidth: CGFloat = 110
    
    var emotion: Emotion
    
    @Binding var selectedEmotionIdList: [Int]
    @Binding var enableButton: Bool
    
    init(selectedEmotionIdList: Binding<[Int]>, enableButton: Binding<Bool>, emotion: Emotion) {
        _selectedEmotionIdList = selectedEmotionIdList
        _enableButton = enableButton
        self.emotion = emotion
    }

    var body: some View {
        
        Button(action: {
            if selectedEmotionIdList.contains(emotion.id) { // 갯수 제한 필요 최소 1, 최대 5
                selectedEmotionIdList.removeAll { $0 == emotion.id}
            } else {
                selectedEmotionIdList.append(emotion.id)
            }
            
            checkButtonState()
        }) {
            VStack {
                AsyncImage(
                    url: URL(string: emotion.emotionURL)!,
                    placeholder: { Text("Loading..") },
                    image: { Image(uiImage: $0).resizable() }
                )
                    .frame(width: 65, height: 65)
                Text(emotion.status)
                    .foregroundColor(selectedEmotionIdList.contains(emotion.id) ? Color.white : Color("BboxxGrayColor"))
                    .fixedSize()
                    .font(.custom("Pretendard-Medium", size: 14))
            }
            .frame(width: imageWidth, height: imageWidth)
            .background(selectedEmotionIdList.contains(emotion.id) ? Color("BboxxGrayColor") : Color.white)
            .clipShape(Circle())
        }
        .frame(width: imageWidth, height: imageWidth)
    }
    
    private func checkButtonState() {
        switch selectedEmotionIdList.count {
        case 0:
            enableButton = true
        case 1...5:
            enableButton = false
        default:
            enableButton = true
        }
    }
}
