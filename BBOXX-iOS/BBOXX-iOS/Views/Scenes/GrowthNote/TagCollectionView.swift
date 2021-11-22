import SwiftUI

struct TagCollectionView: View {
    @State var tags: [Tag] = TagList().tags
    @State private var totalHeight = CGFloat.zero
    
    @Binding var selectedTags: [String]
    @Binding var enableButton: Bool
    
    init(selectedTags: Binding<[String]>,
         enableButton: Binding<Bool>) {
        _selectedTags = selectedTags
        _enableButton = enableButton
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return ZStack(alignment: .topLeading) {
            ForEach(tags.indices) { index in
                item(for: tags[index].text)
                    .padding([.horizontal, .vertical], 8)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tags[index] == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tags[index] == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        Button(action: {
            if selectedTags.contains(text) { // 갯수 제한 필요 최소 1, 최대 5
                selectedTags.removeAll { $0 == text}
            } else {
                selectedTags.append(text)
            }
            
            self.checkButtonState()
        }, label: {
            Text(text)
                .font(.custom("Pretendard-Medium", size: 16))
                .foregroundColor(!self.selectedTags.contains(text) ? Color("BboxxGrayColor").opacity(0.6) : .white)
                .padding()
                .lineLimit(1)
        })
        .background(!self.selectedTags.contains(text) ? Color(.white) : Color("BboxxTextColor"))
        .frame(height: 42)
        .cornerRadius(20)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
    
    private func checkButtonState() {
        switch selectedTags.count {
        case 0:
            enableButton = true
        case 1...5:
            enableButton = false
        default:
            enableButton = true
        }
    }
}

