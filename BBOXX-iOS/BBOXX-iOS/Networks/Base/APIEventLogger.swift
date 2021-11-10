import Foundation
import Alamofire

class APIEventLogger: EventMonitor {

    let queue = DispatchQueue(label: "myNetworkLogger")

    func requestDidFinish(_ request: Request) {
      print("🛰 NETWORK Reqeust LOG")
      print(request.description)

      print("Authorization: " + (request.request?.headers["Authorization"] ?? ""))
      print("Body: " + (request.request?.httpBody?.toPrettyPrintedString ?? ""))
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("🛰 NETWORK Response LOG")
    }
}

extension Data {
    var toPrettyPrintedString: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        return prettyPrintedString as String
    }
}
