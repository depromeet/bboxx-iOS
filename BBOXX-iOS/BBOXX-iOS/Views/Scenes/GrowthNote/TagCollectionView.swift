import SwiftUI

struct TagCollectionView: View {

    var maxLimit: Int
    @Binding var tags: [Tag]
    var fontSize: CGFloat = 16
    
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 15) {
            ScrollView(.horizontal, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 20) {

                    ForEach(getRows(),id: \.self){rows in
                        
                        HStack(spacing: 10){
                            
                            ForEach(rows){row in
                                
                                RowView(tag: row)
                            }
                        }
                    }
                }
                .frame(alignment: .leading)
                .padding(.vertical)
                .padding(.bottom,20)
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 10)
        }
    }
    
    @ViewBuilder
    func RowView(tag: Tag) -> some View {
        
        Text(tag.text)
            .font(.custom("Pretendard-Medium", size: fontSize))
            .foregroundColor(Color("BboxxGrayColor").opacity(0.6))
            .padding(.horizontal,16)
            .padding(.vertical,10)
            .background(
                Capsule()
                    .fill(Color(.white))
            )
            .foregroundColor(Color("BboxxTextColor"))
            .lineLimit(1)
            .contentShape(Capsule())
    }
    
    func getIndex(tag: Tag) -> Int {
        
        let index = tags.firstIndex { currentTag in
            return tag.id == currentTag.id
        } ?? 0
        
        return index
    }
    
    func getRows() -> [[Tag]] {
        
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        var totalWidth: CGFloat = 0
        let screenWidth: CGFloat = UIScreen.main.bounds.width / 2.2
        
        tags.forEach { tag in
            
            totalWidth += (tag.size + 40)
            
            if totalWidth > screenWidth {
                
                totalWidth = (!currentRow.isEmpty || rows.isEmpty ? (tag.size + 40) : 0)
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
            } else {
                currentRow.append(tag)
            }
        }
        
        if !currentRow.isEmpty{
            rows.append(currentRow)
            currentRow.removeAll()
        }
        
        return rows
    }
}

// MARK: Global Function
func addTag(tags: [Tag],
            text: String,
            fontSize: CGFloat,
            maxLimit: Int,
            completion: @escaping (Bool,Tag)->()){
    
    let font = UIFont.systemFont(ofSize: fontSize)
    
    let attributes = [NSAttributedString.Key.font: font]
    
    let size = (text as NSString).size(withAttributes: attributes)
    
    let tag = Tag(text: text, size: size.width)
    
    if (getSize(tags: tags) + text.count) < maxLimit{
        completion(false,tag)
    }else{
        completion(true,tag)
    }
}

func getSize(tags: [Tag]) -> Int {
    var count: Int = 0
    
    tags.forEach { tag in
        count += tag.text.count
    }
    
    return count
}
