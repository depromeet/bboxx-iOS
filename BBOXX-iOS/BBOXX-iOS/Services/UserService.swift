import Alamofire

class UserService {
    
    func createNickname(){
        let url = APIConstants.BaseURL + "api/v1/generate-member-nickname"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Accept": "application/hal+json",
            //"Authorization": token
        ]
        
        AF.request(url, method: .post, headers: header).responseJSON { (response) in
            print("response: \(response)")
        }.resume()
    }
}
