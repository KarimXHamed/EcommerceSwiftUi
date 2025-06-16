//
//  NetworkProvider.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 15/06/2025.
//
import Alamofire
import Factory

class NetworkProvider: NetworkProviederProtocol {
    
    @Injected(\.responseHandler) private var responseHandler: ResponseHandler
    @Injected(\.requestBuilder) private var requestBuilder: RequestBuilderProtocol
    
    func get<T:Codable>(endpoint: EndpointProtocol, model: T.Type) async throws -> T  {
        return try await performRequest(endpoint: endpoint, method: HTTPMethod.get.rawValue, model:model)
        
    }
    
    
    func post<T:Codable>(endpoint: EndpointProtocol, model: T.Type) async throws -> T {
        return try await performRequest(endpoint: endpoint, method: HTTPMethod.get.rawValue, model:model)
        
    }
    
    func put<T:Codable>(endpoint: EndpointProtocol, model: T.Type) async throws -> T {
        return try await performRequest(endpoint: endpoint, method: HTTPMethod.get.rawValue, model:model)
        
    }
    
    func delete<T:Codable>(endpoint: EndpointProtocol, model: T.Type) async throws -> T {
        return try await performRequest(endpoint: endpoint, method: HTTPMethod.get.rawValue, model:model)
        
    }
    
    private func performRequest<T:Codable>(endpoint: EndpointProtocol, method:String, model: T.Type) async throws -> T {
        let request = requestBuilder.makeRequest(endpoint: endpoint, method: HTTPMethod.get.rawValue)
        
        let response = await request
            .validate(statusCode: 200..<300)
            .serializingDecodable(T.self).response
        
        return try await responseHandler.handleResponse(result: response.result)
    }
    
}
