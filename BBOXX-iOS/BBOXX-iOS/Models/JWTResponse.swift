struct JWTResponse: Codable {
    let code: String
    let data: Jwt
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code, data, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(String.self, forKey: .code)) ?? ""
        data = (try? values.decode(Jwt.self, forKey: .data)) ?? Jwt.init(valid: false)
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

struct Jwt: Codable {
    let valid: Bool
}
