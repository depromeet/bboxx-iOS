import SwiftUI

struct FeelingButton: View {
    
    @State private var selected = false
    @State var image: UIImage = UIImage()
    private let imageWidth: CGFloat = 136
    
    var emotion: Emotion
    var viewModel: SelectFeelingViewModel
    
    var body: some View {
        
        Button(action: {
            self.selected.toggle()
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
            }
            .frame(width: imageWidth, height: imageWidth)
            .background(selected ? Color.black : Color.white)
            .clipShape(Circle())
        }
        .frame(width: imageWidth, height: imageWidth)
    }
    
}
