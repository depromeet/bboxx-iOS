import SwiftUI

class SelectCategoryViewModel: ObservableObject {
    
    var categoryId: Int = 0
    
    init() {
        
    }
    
    func selectCategoryId(_ category: String) {
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
        
        UserDefaults.standard.setValue(categoryId, forKey: "categoryId")
        UserDefaults.standard.setValue(category, forKey: "category")
    }
}
