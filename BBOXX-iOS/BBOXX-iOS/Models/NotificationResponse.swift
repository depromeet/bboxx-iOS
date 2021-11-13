import Foundation

struct NotificationResponse: Codable {
    let code: String
    let data: [Notification]
    let message: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(String.self, forKey: .code)) ?? ""
        data = (try? values.decode([Notification].self, forKey: .data)) ?? []
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

struct Notification: Codable {
    let id: Int
    let createdAt: String
    let emotionDiaryId: Int
    let message: String
    let receiverId: Int
    let state, title, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case createdAt
        case emotionDiaryId
        case id, message
        case receiverId
        case state, title, updatedAt
    }
}
