import Alamofire

class UserService {
    
    private init() {}
        
    static let shared = UserService()
    
    func createNickname(){
        let url = APIConstants.BaseURL + "api/v1/generate-member-nickname"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Accept": "application/hal+json",
            //"Authorization": token
        ]
        
        AF.request(url, method: .post, headers: header).responseJSON { (response) in
            do {
                let decoder = JSONDecoder()
                
                switch (response.result) {
                case .success:
                    let result = try decoder.decode(Response.self, from: response.data!)
                    print("success: \(result)")
                    break
                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error: ", parsingError)
            }
        }.resume()
    }
}
