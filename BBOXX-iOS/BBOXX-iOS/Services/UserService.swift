import Alamofire

class UserService {
    
    private init() {}
        
    static let shared = UserService()
    
    func createNickname(_ completion: @escaping (Result<Response, Error>) -> ()) {
        let url = APIConstants.BaseURL + "api/v1/generate-member-nickname"
        
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
                    let result = try JSONDecoder().decode(Response.self, from: json)
                    completion(.success(result))
                    
                } catch(let error) {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }.resume()
    }
}
