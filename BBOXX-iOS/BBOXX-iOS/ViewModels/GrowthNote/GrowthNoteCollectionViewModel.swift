import SwiftUI

class GrowthNoteCollectionViewModel: ObservableObject {
    
    @Published var dateString: String = ""
    var year: Int = 0
    var month: Int = 0
        
    var growthNoteList: [GrowthNote] = []
    
    init() {
        convertCurrentDate()
    }
    
    let backgroundColors: [Color] = [
        Color(red: 164 / 255, green: 93 / 255, blue: 99 / 255),
        Color(red: 198 / 255, green: 129 / 255, blue: 91 / 255),
        Color(red: 203 / 255, green: 163 / 255, blue: 103 / 255),
        Color(red: 105 / 255, green: 120 / 255, blue: 85 / 255),
        Color(red: 91 / 255, green: 122 / 255, blue: 107 / 255),
        Color(red: 99 / 255, green: 124 / 255, blue: 148 / 255),
        Color(red: 80 / 255, green: 84 / 255, blue: 116 / 255),
        Color(red: 119 / 255, green: 97 / 255, blue: 130 / 255),
        Color(red: 95 / 255, green: 91 / 255, blue: 109 / 255),
        Color(red: 151 / 255, green: 138 / 255, blue: 123 / 255),
        Color(red: 94 / 255, green: 78 / 255, blue: 65 / 255),
    ]
    
    func setBackgroundColor(_ index: Int) -> Color {
        return backgroundColors[index % 11]
    }
    
    func leftButtonDidTap() {
        // 이전 달로 이동
    }
    
    func rightButtonDidTap() {
        // 다음 달로 이동
    }
    
    func convertCurrentDate() {        
        let nowDate = Date() // 현재의 Date
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy"
        dateFormatter.locale = Locale(identifier:"ko_KR")
        year = Int(dateFormatter.string(from: nowDate)) ?? 0
        
        dateFormatter.dateFormat = "M"
        dateFormatter.locale = Locale(identifier:"ko_KR")
        month = Int(dateFormatter.string(from: nowDate)) ?? 0
        
        dateString = "\(year)년 \(month)월"
        
        getGrowthNotes(memberId: 0, month: month, year: year)
    }
    
    func getGrowthNotes(memberId: Int, month: Int, year: Int) {
        GrowthNoteService.shared.getGrowthNotes(memberId, month, year) { (result) in
            switch result {
            case .success(let response):
                self.growthNoteList = response.data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
