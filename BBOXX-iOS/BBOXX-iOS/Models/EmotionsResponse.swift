import Foundation

struct EmotionsResponse: Codable {
    let code: String
    let data: EmotionList
    let message: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(String.self, forKey: .code)) ?? ""
        data = (try? values.decode(EmotionList.self, forKey: .data)) ?? EmotionList(emotions: [])
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

struct EmotionList: Codable {
    let emotions: [Emotion]
}

struct Emotion: Codable {
    let emotionURL: String
    let id: Int
    let status: String

    enum CodingKeys: String, CodingKey {
        case emotionURL = "emotionUrl"
        case id, status
    }
}
