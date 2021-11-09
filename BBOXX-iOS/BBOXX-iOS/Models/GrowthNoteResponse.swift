import Foundation

struct GrowthNoteResponse: Codable{
    let code: String
    let data: [GrowthNote]
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code, data, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(String.self, forKey: .code)) ?? ""
        data = (try? values.decode([GrowthNote]?.self, forKey: .data)) ?? [GrowthNote(content: "", createAt: "", emotionDiaryId: -1, id: -1, memberId: -1, tags: nil, title: "", updateAt: "")]
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

struct GrowthNote: Codable{
    let content: String
    let createAt: String
    let emotionDiaryId: Int
    let id: Int
    let memberId: Int
    let tags: [String]?
    let title: String
    let updateAt: String
}
