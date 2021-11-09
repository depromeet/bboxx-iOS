import Foundation

struct DecibelResponse: Codable{
    let code: String
    let data: Decibel
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code, data, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(String.self, forKey: .code)) ?? ""
        data = (try? values.decode(Decibel.self, forKey: .data)) ?? Decibel(id: -1, decibel: -1)
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}


struct Decibel: Codable{
    let id: Int?
    let decibel: Int?
}
