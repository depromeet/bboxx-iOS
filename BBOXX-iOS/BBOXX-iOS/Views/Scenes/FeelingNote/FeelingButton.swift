import SwiftUI

struct FeelingButton: View {
    
    @State private var selected = false
    @State var image: UIImage = UIImage()
    private let imageWidth: CGFloat = 136
    
    var emotion: Emotion
    
    var body: some View {
        
        Button(action: {
            // TODO: check selected feelings 1~5
            // selectedFeelingCount
            self.selected.toggle()
        }) {
            ZStack {
                VStack {
                    Image("")
                        .data(url: URL(string: emotion.emotionURL)!)
                        .resizable()
                        .frame(width: 78, height: 78)
                    Text(emotion.status)
                }
                .background(selected ? Color.black : Color.white)
                .clipShape(Circle())
                
            }
        }
        .frame(width: imageWidth, height: imageWidth)
    }
    
}
