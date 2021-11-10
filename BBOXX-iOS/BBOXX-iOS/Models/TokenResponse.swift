import Foundation

struct TokenResponse: Codable{
    let code: String
    let data: Token
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code, data, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(String.self, forKey: .code)) ?? ""
        data = (try? values.decode(Token.self, forKey: .data)) ?? Token(token: "")
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}


struct Token: Codable{
    let token: String
}
