//
//  CategoriesRequest.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 15/06/2025.
//
import Foundation

struct CategoriesRequest: EndpointProtocol {
    var baseURL: URL {
        return URL(string: "https://dummyjson.com")!
    }
    
    var path: String = "/products/categories"
    
    var parameters: [FieldKey : Any]?
    
    var headers: [FieldKey : String]?
    
    var credentials: String?
    
    var timeout: TimeInterval?
    
    var queryItems: [FieldKey : String]?
    
    var fileName: String?
    
    func buildBody() -> [FieldKey : Any] {
        return [:]
    }
    
    
}
