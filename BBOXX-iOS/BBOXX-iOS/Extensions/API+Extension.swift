//
//  API+Extension.swift
//  BBOXX-iOS
//
//  Created by mac on 2021/10/30.
//

import Foundation


extension Endpoint where Response: Swift.Decodable {
  convenience init(method: Method = .get,
                   path: Path,
                   codingKey: String? = nil,
                   parameters: Parameters? = nil) {
    self.init(method: method, path: path, parameters: parameters, codingKey: codingKey) {
      if let key = codingKey {
        guard let value = try decoder.decode([String:Response].self, from: $0)[key] else {
          throw RestClientError.valueNotFound(codingKey: key)
        }
        return value
      }

      return try decoder.decode(Response.self, from: $0)
    }
  }
}


extension API {
  static func getMusic() -> Endpoint<[Applmusic]> {
    return Endpoint(method: .get,
                    path: "/api/music",
                    codingKey: "applmusic")
  }
}

