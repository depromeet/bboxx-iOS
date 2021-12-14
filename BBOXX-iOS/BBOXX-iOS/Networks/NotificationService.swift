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
    
    func registerToken(_ memberId: Int, _ FCMToken: String, _ completion: @escaping (Result<Response, Error>) -> ()) {
        let url = Secret.BaseURL + "push-tokens/register"
        
        var token = "Bearer "
        token += KeychainWrapper.standard.string(forKey: "token") ?? ""
      
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Authorization": token
        ]
        
        let params: Parameters = [
            "ownerId": memberId,
            "token": FCMToken
        ]
        
        API.session.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(Response.self, from: json)
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
    
    func deregisterToken(_ memberId: Int, _ completion: @escaping (Result<Response, Error>) -> ()) {
        let url = Secret.BaseURL + "push-tokens/deregister"
        
        var token = "Bearer "
        token += KeychainWrapper.standard.string(forKey: "token") ?? ""
      
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Authorization": token
        ]
        
        let params: Parameters = [
            "ownerId": memberId
        ]
        
        API.session.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(Response.self, from: json)
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
