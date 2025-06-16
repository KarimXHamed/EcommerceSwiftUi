//
//  FlashSaleProductsRequest.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Foundation

struct FlashSaleProductsRequest: EndpointProtocol {
    var baseURL: URL {
        URL(string: "https://dummyjson.com")!
    }
    
    var path: String = "/products/category/smartphones"
    
    var parameters: [FieldKey : Any]?
    
    var headers: [FieldKey : String]?
    
    var credentials: String?
    
    var timeout: TimeInterval?
    
    var queryItems: [FieldKey : String]?
    
    var fileName: String?
    
    func buildBody() -> [FieldKey : Any] {
        [:]
    }
    
    
}
