//
//  Untitled.swift
//  SolutionX
//
//  Created by Karim Hamed  on 30/01/2025.
//

import Foundation
import Alamofire

class RequestBuilder: RequestBuilderProtocol {
    private var urlComponents: URLComponents?
    private var urlRequest: URLRequest?
    //MARK: -configuiring the request
    func setBaseURL(baseURL: URL?, path: String?) {
        guard let baseURL=baseURL else {return}
        guard let path=path else {return}
        self.urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        self.urlComponents?.path = path
        if let finalURL = urlComponents?.url {
            self.urlRequest = URLRequest(url: finalURL)
        }
    }
    private func setMethod(method: String?) {
        guard let method=method else {return}
        self.urlRequest?.httpMethod=method
    }
    
    
    private func getFinalUrl(endpoint: EndpointProtocol) -> URLConvertible? {
        setBaseURL(baseURL: endpoint.baseURL, path: endpoint.path)
        
        if let queryItems = endpoint.queryItems {
            let queryItemsArray = queryItems.map { URLQueryItem(name: $0.rawValue, value: $1) }
            if self.urlComponents?.queryItems == nil {
                self.urlComponents?.queryItems = queryItemsArray
            } else {
                self.urlComponents?.queryItems?.append(contentsOf: queryItemsArray)
            }
        }
        
        return self.urlComponents?.url 
    }
    
    
    
    private func addHeaders(headers: [FieldKey: String]?) -> HTTPHeaders? {
        guard let headers = headers else { return nil }
        
        let headerDict = headers.reduce(into: [String: String]()) {
            $0[$1.key.rawValue] = $1.value
        }
        
        return HTTPHeaders(headerDict)
    }
    
    
    private func setBody(parameters: Any?) -> [String:Any]? {
        guard let parameters = parameters as? [FieldKey: Any] else { return nil }
        
        let convertedParameters = Dictionary(uniqueKeysWithValues: parameters.map { ($0.rawValue, $1) })
        
        return convertedParameters
    }
    
    private func setTimeout(seconds: TimeInterval?) -> TimeInterval{
            return seconds ?? 60
        
    }
    
    
    func makeRequest(endpoint:EndpointProtocol,method:String) -> DataRequest {
        
        guard let finalUrl = getFinalUrl(endpoint: endpoint) else {
              fatalError("Invalid URL or query items")
          }
        
        return  AF.request(finalUrl,
                           method: Alamofire.HTTPMethod(rawValue:method),
                           parameters:setBody(parameters: endpoint.parameters),
                           headers: addHeaders(headers: endpoint.headers),
                           requestModifier: { $0.timeoutInterval = self.setTimeout(seconds: endpoint.timeout) })
        
    }
}
