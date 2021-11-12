import Alamofire
import SwiftKeychainWrapper

class UserService {
    private init() {}
        
    static let shared = UserService()
    
    func createNickname(_ completion: @escaping (Result<NicknameResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "generate-member-nickname"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Accept": "application/hal+json",
            //"Authorization": token
        ]
        
        AF.request(url, method: .post, headers: header).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(NicknameResponse.self, from: json)
                    completion(.success(result))
                    
                } catch(let error) {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }.resume()
    }
    
    // 요청 위치 : 메인 화면에서 memberId를 받아와야 함 (서버에서 전달 받을때 id 라는 값이 memberId)
    func getMe(_ completion: @escaping (Result<UserResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "me"
        
        var token = "Bearer "
        token += KeychainWrapper.standard.string(forKey: "token") ?? ""
      
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Authorization": token
        ]
        
        API.session.request(url, method: .get, headers: header).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(UserResponse.self, from: json)
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
    
    // 요청 위치 : 마이페이지
    func getUserInfo(_ memberId: Int, _ completion: @escaping (Result<UserResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "members"
        
        let parameters: Parameters = ["memberId": memberId]
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Accept": "application/hal+json",
            //"Authorization": token
        ]
        
        API.session.request(url, method: .get, parameters: parameters, headers: header)
            .debugLog()
            .responseJSON { (response) in

            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    print(jsonData)
                    let result = try JSONDecoder().decode(UserResponse.self, from: json)
                   
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
    
    //  요청 위치 : 닉네임 변경
    func updateNickname(_ memberId: Int, _ nickName: String, _ completion: @escaping (Result<UserResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "members"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Accept": "application/hal+json",
            //"Authorization": token
        ]
        
        let params: Parameters = [
                "memberId": memberId,
                "nickname": nickName
        ]
        
        
        API.session.request(url, method: .put, parameters: params, headers: header)
            .debugLog()
            .responseJSON { (response) in

            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    print(jsonData)
                    
                    let result = try JSONDecoder().decode(UserResponse.self, from: json)
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

