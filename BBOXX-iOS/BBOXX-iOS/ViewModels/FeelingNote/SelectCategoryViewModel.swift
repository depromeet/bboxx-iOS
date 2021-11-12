import SwiftUI

class SelectCategoryViewModel: ObservableObject {
    
    @Published var categoryId: Int = 0
    
    init() {
        
    }
    
    func selectCategoryId(category: String) {
        switch category {
        case "직장문제":
            self.categoryId = 1
        case "학업문제":
            self.categoryId = 2
        case "취업문제":
            self.categoryId = 3
        case "가족문제":
            self.categoryId = 4
        case "대인관계":
            self.categoryId = 5
        case "다른문제":
            self.categoryId = 6
        default:
            break
        }
    }
}
