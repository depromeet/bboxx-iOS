import Alamofire

class AuthService {
    init() {}
        
    static let shared = AuthService()
    
    func signIn(_ authData: String, _ providerType: String, _ completion: @escaping (Result<TokenResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "auth/signin"
        
        let params: Parameters = [
            "authData": authData,
            "providerType": providerType
        ]
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        API.session.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header) .debugLog().responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(TokenResponse.self, from: json)
                    completion(.success(result))
                    print(result)
                    
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
        let url = Secret.BaseURL + "auth/signup"
        
        let params: Parameters = [
            "authData": authData,
            "nickname": nickname,
            "providerType": providerType
        ]
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8"
        ]
        
        API.session.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header) .debugLog().responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
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
    
    func validateJWT(jwt: String, _ completion: @escaping (Result<JWTResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "auth/validate-jwt"
        
        let params: Parameters = [
                "jwt": jwt
            ]
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        API.session.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header) .debugLog().responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(JWTResponse.self, from: json)
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

