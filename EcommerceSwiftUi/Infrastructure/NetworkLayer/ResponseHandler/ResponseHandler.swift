//
//  ResponseHandler.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Alamofire

class ResponseHandler {
    
    func handleResponse<T:Codable>(result:Result<T,AFError>) async throws -> T {
        
        switch result {
            
        case .success(let result):
            return result
            
        case .failure(let error):
            
            if let afError = error.asAFError {
                let statusCode = afError.responseCode!
                throw LeonException.getErrorFromStatusCode(statusCode: statusCode)
            }
            
        }
        throw LeonException.unknown(.unknown)
        
    }
    
}
