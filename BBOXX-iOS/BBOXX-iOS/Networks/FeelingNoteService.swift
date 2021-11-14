import Alamofire
import SwiftKeychainWrapper

class FeelingNoteService{
    private init() {}
        
    static let shared = FeelingNoteService()
    
    //  호출 위치 : 감정일기 이모션들 가져올때
    func getEmotions(_ completion: @escaping (Result<EmotionsResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "emotions"
        
        var token = "Bearer "
        token += KeychainWrapper.standard.string(forKey: "token") ?? ""
      
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Authorization": token
        ]
        
        API.session.request(url, method: .get,  headers: header).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(EmotionsResponse.self, from: json)
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
    
    //  호출 위치 : 감정일기 등록 할때
    func postFeelingNote(_ categoryId: Int,_ content: String,_ emotionStatusList: [Int],_ memberId: Int, _ title: String, _ completion: @escaping (Result<Response, Error>) -> ()) {
        let url = Secret.BaseURL + "emotions"
        
        var token = "Bearer "
        token += KeychainWrapper.standard.string(forKey: "token") ?? ""
        
        let params: Parameters = [
            "categoryId": categoryId,
            "content": content,
            "emotionStatusList": emotionStatusList,
            "memberId": memberId,
            "title": title
        ]
      
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Authorization": token
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
    
    //  호출 위치 : 감정일기 불러올때
    func getFeelingNote(_ feelingNoteId: Int, _ completion: @escaping (Result<FeelingNoteResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "emotions"
        
        var token = "Bearer "
        token += KeychainWrapper.standard.string(forKey: "token") ?? ""
      
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Authorization": token
        ]
        
        let params: Parameters = [
            "emotionId": feelingNoteId
        ]
        
        API.session.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                   
                    let result = try JSONDecoder().decode(FeelingNoteResponse.self, from: json)
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
    
    func deleteFeelingNote(_ feelingNoteId: Int, _ completion: @escaping (Result<Response, Error>) -> ()) {
        let url = Secret.BaseURL + "emotions"
        
        var token = "Bearer "
        token += KeychainWrapper.standard.string(forKey: "token") ?? ""
      
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Authorization": token
        ]
        
        let params: Parameters = [
            "emotionId": feelingNoteId
        ]
        
        API.session.request(url, method: .delete, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
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
