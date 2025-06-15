//
//  NetworkProviederProtocol.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 15/06/2025.
//
protocol NetworkProviederProtocol {
    func get<T:Codable>(endPoint: EndpointProtocol, model: T.Type)
    func post<T:Codable>(endPoint: EndpointProtocol, model: T.Type)
    func put<T:Codable>(endPoint: EndpointProtocol, model: T.Type)
    func delete<T:Codable>(endPoint: EndpointProtocol, model: T.Type)
}
