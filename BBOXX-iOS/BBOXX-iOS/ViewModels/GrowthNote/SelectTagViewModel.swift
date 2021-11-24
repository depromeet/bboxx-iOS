import Foundation

class SelectTagViewModel: ObservableObject {
    
//    @Published var selectedTags: [String] = []
    @Published var selected: [Bool] = []
    @Published var items: [String] = []
    @Published var tags: [Tag] = []
    
    init(tags: [Tag]) {
        self.tags = tags
        setupSelected()
        setupItems()
    }
    
    func setupSelected() {
        for _ in 0..<tags.count {
            selected.append(false)
        }
    }
    
    func setupItems() {
        for index in 0..<tags.count {
            items.append(tags[index].text)
        }
    }
}
