//
//  CommonDI.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Factory

extension Container {
    var networkProvider: Factory<NetworkProviederProtocol> {
        self {NetworkProvider()}
    }
    
    var requestBuilder: Factory<RequestBuilderProtocol> {
        self {RequestBuilder()}
    }
    
    var responseHandler: Factory<ResponseHandler> {
        self {ResponseHandler()}
    }
    
    var homeRepository: Factory<HomeRepositoryProtocol> {
        self {HomeRepository()}
    }
}
