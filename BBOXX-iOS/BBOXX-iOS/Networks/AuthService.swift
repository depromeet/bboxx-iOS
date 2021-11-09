import Alamofire

class AuthService {
    init() {}
        
    static let shared = AuthService()
    
    func signIn(_ authData: String, _ providerType: String, _ completion: @escaping (Result<TokenResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "auth"
        
        let params: Parameters = [
                "authData": authData,
                "providerType": providerType
            ]
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Accept": "application/hal+json",
            //"Authorization": token
        ]
        
        API.session.request(url, method: .post, parameters: params, headers: header).debugLog().responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    print("SignIn : \(jsonData)")
                    let result = try JSONDecoder().decode(TokenResponse.self, from: json)
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
    
    func signUp(_ authData: String,_ nickname: String, _ providerType: String, _ completion: @escaping (Result<TokenResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "auth"
        
        let params: Parameters = [
                "authData": authData,
                "nickname": nickname,
                "providerType": providerType
            ]
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Accept": "application/hal+json",
            //"Authorization": token
        ]
        
        API.session.request(url, method: .post, parameters: params, headers: header).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    print("SignUp : \(jsonData)")
                    let result = try JSONDecoder().decode(TokenResponse.self, from: json)
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

