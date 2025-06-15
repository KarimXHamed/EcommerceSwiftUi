//
//  NetworkProvider.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 15/06/2025.
//
import Alamofire

class NetworkProvider: NetworkProviederProtocol {
    func get<T:Codable>(endPoint: any EndpointProtocol, model: T.Type)  {
        let builder = RequestBuilder()
        let request = builder.makeRequest(endpoint: endPoint, method: HTTPMethod.get.rawValue)
        request
            .validate()
            .responseDecodable(of: T.self) { response in 
                switch response.result {
                case .success(let user):
                    print(user)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    
    
    func post<T:Codable>(endPoint: any EndpointProtocol, model: T.Type)  {
        let builder = RequestBuilder()
        let request = builder.makeRequest(endpoint: endPoint, method: HTTPMethod.post.rawValue)
    }
    
    func put<T:Codable>(endPoint: any EndpointProtocol, model: T.Type)  {
        let builder = RequestBuilder()
        let request = builder.makeRequest(endpoint: endPoint, method: HTTPMethod.put.rawValue)
    }
    
    func delete<T:Codable>(endPoint: any EndpointProtocol, model: T.Type) {
        let builder = RequestBuilder()
        let request = builder.makeRequest(endpoint: endPoint, method: HTTPMethod.delete.rawValue)
    }
    
    
    
    
}
