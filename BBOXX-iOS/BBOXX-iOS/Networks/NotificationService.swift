import Alamofire
import SwiftKeychainWrapper

struct NotificationService {
    private init() {}
        
    static let shared = NotificationService()
    
    func getNotifications(_ memberId: Int, _ completion: @escaping (Result<NotificationResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "notifications"
        
        var token = "Bearer "
        token += KeychainWrapper.standard.string(forKey: "token") ?? ""

        let params: Parameters = [
            "receiver_id": memberId
        ]
      
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Authorization": token
        ]
        
        API.session.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(NotificationResponse.self, from: json)
                    completion(.success(result))
                    
                } catch(let error) {
                    print(error)
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }.resume()
    }
}
