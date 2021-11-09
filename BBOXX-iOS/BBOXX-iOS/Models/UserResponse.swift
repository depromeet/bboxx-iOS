import Foundation

struct UserResponse: Codable{
    let code: String
    let data: User
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code, data, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(String.self, forKey: .code)) ?? ""
        data = (try? values.decode(User.self, forKey: .data)) ?? User(id: -1, nickname: "", socialProviderType: "", state: "")
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

struct User: Codable{
    let id: Int
    let nickname: String
    let socialProviderType: String
    let state: String
}
