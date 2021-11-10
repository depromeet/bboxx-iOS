import Foundation

struct NicknameResponse: Codable {
    let code: String
    let data: Nickname
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code, data, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(String.self, forKey: .code)) ?? ""
        data = (try? values.decode(Nickname.self, forKey: .data)) ?? Nickname.init(nickname: "")
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

struct Nickname: Codable {
    let nickname: String
}
