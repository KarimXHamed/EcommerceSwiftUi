//
//  EndpointProtocol.swift
//  AlTasherat-IOS-G2-T1
//
//  Created by Karim Hamed  on 12/03/2025.
//
import Foundation

protocol EndpointProtocol{
    
    var baseURL: URL { get }
    var path: String { get }
    var parameters: [FieldKey: Any]? {get}
    var headers: [FieldKey: String]? { get }
    var credentials: String? { get }
    var timeout:TimeInterval? {get}
    var queryItems:[FieldKey:String]? {get}
    var fileName: String? {get}
    func buildBody()->[FieldKey: Any]
    
}
