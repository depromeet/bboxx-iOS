import Alamofire

class GrowthNoteService{
    private init() {}
    
    static let shared = GrowthNoteService()
    
    //  요청 위치 : 성장일기 목록 가져올 때
    func getGrowthNotes(_ memberId: Int, _ month: Int, _ year: Int, _ completion: @escaping (Result<GrowthNoteResponse, Error>) -> ()) {
        let url = Secret.BaseURL + "improvement-diaries"
        
        let params: Parameters = [
            "memberId": memberId,
            "month": month,
            "year": year
        ]
   
        let header: HTTPHeaders = [
            "Content-Type" : "application/json;charset=UTF-8",
            "Accept": "application/hal+json",
            //"Authorization": token
        ]
        
        API.session.request(url, method: .get, parameters: params, headers: header).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                do {
                    let json = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                    let result = try JSONDecoder().decode(GrowthNoteResponse.self, from: json)
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
    
    //  요청 위치 : 성장일기 쓸때
    func postGrowthNote(_ content: String, _ emotionDiaryId: Int, _ memberId: Int,_ tags: String, _ title: String, _ completion: @escaping (Result<Response, Error>) -> ()) {
        let url = Secret.BaseURL + "improvement-diaries"
        
        let params: Parameters = [
            "content": content,
            "emotionDiaryId": emotionDiaryId,
            "memberId": memberId,
            "tags": tags,
            "title": title
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
