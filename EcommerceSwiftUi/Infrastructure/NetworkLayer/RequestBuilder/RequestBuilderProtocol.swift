//
//  RequestBuilderProtocol.swift
//  SolutionX
//
//  Created by Karim Hamed  on 06/02/2025.
//
import Alamofire
protocol RequestBuilderProtocol{
    func makeRequest(endpoint:EndpointProtocol,method:String) -> DataRequest
}
