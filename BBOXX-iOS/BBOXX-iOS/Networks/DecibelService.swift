import Alamofire

class DecibelService{
    private init() {}
        
    static let shared = DecibelService()
    
    //  요청 위치 : 데시벨 등록 할때 , 리스펀 값이 : Id 인데 뭔 Id 인지 재확인 필요
    func postDecibel(_ decibel: Int, _ memberId: Int, _ completion: @escaping (Result<DecibelResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "decibel"
        
        let params: Parameters = [
                "decibel": decibel,
                "memberId": memberId
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
                    print("DecibelResponse : \(jsonData)")
                    let result = try JSONDecoder().decode(DecibelResponse.self, from: json)
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
    
    
    func getDecibelInfo(_ completion: @escaping (Result<DecibelResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "decibel"
        
   
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Accept": "application/hal+json",
            //"Authorization": token
        ]
        
        API.session.request(url, method: .get, headers: header).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    print("DecibelResponse : \(jsonData)")
                    let result = try JSONDecoder().decode(DecibelResponse.self, from: json)
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
