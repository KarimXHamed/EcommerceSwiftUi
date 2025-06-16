//
//  NetworkProviederProtocol.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 15/06/2025.
//
protocol NetworkProviederProtocol {
    func get<T:Codable>(endpoint: EndpointProtocol, model: T.Type) async throws -> T
    
    func post<T:Codable>(endpoint: EndpointProtocol, model: T.Type) async throws -> T
    
    func put<T:Codable>(endpoint: EndpointProtocol, model: T.Type) async throws -> T
    
    func delete<T:Codable>(endpoint: EndpointProtocol, model: T.Type) async throws -> T
}
