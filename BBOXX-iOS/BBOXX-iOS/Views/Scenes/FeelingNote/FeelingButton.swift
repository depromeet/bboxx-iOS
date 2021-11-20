import SwiftUI

struct FeelingButton: View {
    
    @State private var selected: Bool = false
    @State var image: UIImage = UIImage()
    private let imageWidth: CGFloat = 136
    
    var emotion: Emotion
    var viewModel: SelectFeelingViewModel
    
    var body: some View {
        
        Button(action: {
            self.selected.toggle()
            if selected {
                viewModel.selectedEmotions[emotion.status] = true
            }
        }) {
            VStack {
                AsyncImage(
                    url: URL(string: emotion.emotionURL)!,
                    placeholder: { Text("Loading..") },
                    image: { Image(uiImage: $0).resizable() }
                )
                    .frame(width: 78, height: 78)
                Text(emotion.status)
                    .foregroundColor(selected ? Color.white : Color.black)
                    .fixedSize()
                    .foregroundColor(Color("BboxxGrayColor"))
                    .font(.custom("Pretendard-Regular", size: 14))
            }
            .frame(width: imageWidth, height: imageWidth)
            .background(selected ? Color.black : Color.white)
            .clipShape(Circle())
        }
        .frame(width: imageWidth, height: imageWidth)
    }
    
}
