import Foundation

struct FeelingNoteResponse: Codable{
    let code: String
    let data: FeelingNote
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code, data, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(String.self, forKey: .code)) ?? ""
        data = (try? values.decode(FeelingNote?.self, forKey: .data)) ?? FeelingNote(categoryId: 1, content: "", createdAt: "", emotionStatusList: [], id: 1, memberId: 1, title: "", updateAt: "")
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

struct FeelingNote: Codable{
    let categoryId: Int
    let content: String
    let createdAt: String
    let emotionStatusList: [Emotion]
    let id: Int
    let memberId: Int
    let title: String
    let updateAt: String
}
