import Foundation

struct Response: Codable {
    let code: String
    let data: Body
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code, data, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(String.self, forKey: .code)) ?? ""
        data = (try? values.decode(Body.self, forKey: .data)) ?? Body.init(nickname: "")
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

struct Body: Codable {
    let nickname: String
}
