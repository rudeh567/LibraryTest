import Foundation
import Alamofire

class Network {
    static let apiKey = "a3d42dfb-5fa9-4d3e-ad9c-4ead4d13b3db"
    
    static let shared = Network()
    
    class var baseURL : String {
        return "https://api.thecatapi.com"
    }
    
    static var sessionManager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [:]
        configuration.httpAdditionalHeaders?["Accept"] = "application/json"
        return Alamofire.Session(configuration: configuration)
    }()
    
    func getRandomCatPicture(parameters : Parameters, completion : @escaping(_ result : Data) -> (Void)){
        let url = "/v1/images/search"
        let parameters : Parameters = parameters
        Network.sessionManager.request(Network.baseURL + url, method: .get, parameters:  parameters).responseJSON { (response) in
            switch response.result{
            case .success(_):
                completion(response.data!)
                break
            case .failure(let error):
                print(error)
                print(response.data!)
                break
            }
        }
    }
}
