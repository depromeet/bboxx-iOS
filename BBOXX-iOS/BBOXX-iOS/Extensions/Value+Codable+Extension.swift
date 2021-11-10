//
//  Value+Codable+Extension.swift
//  BBOXX-iOS
//
//  생성 목적
//  -> API통신을 하다보면 같은 Model로 Response가 오지만 특정 값의 타입이 일정하지 않은 경우 대비
//  사용 방법
//  class Test: Codable {
//      let id: AnyValue!
//  }
//  let intID = test.id.intValue  동일하게 String도 가능
//  Created by JG on 2021/10/30.
//

import Foundation
import Alamofire


enum AnyValue: Codable {
    case int(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        }

        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }

        // 디코딩 가능한 타입이 없는경우 typeMismatch 에러 발생
        throw AnyValueError.typeMismatch
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .int(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }

    enum AnyValueError:Error {
        case typeMismatch
    }
}

extension AnyValue {
    var intValue: Int? {
        switch self {
        case .int(let value):
            return value
        case .string(let value):
            return Int(value)
        }
    }
    
    var stringValue: String? {
        switch self {
        case .int(let value):
            return String(value)
        case .string(let value):
            return value
        }
    }
}


extension Request {
   public func debugLog() -> Self {
        #if DEBUG
           debugPrint("=======================================")
           debugPrint(self)
           debugPrint("=======================================")
        #endif
      return self
   }
}
