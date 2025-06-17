//
//  GetFlashSaleProductsUseCaseProtocol.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 17/06/2025.
//
import Combine

protocol GetFlashSaleProductsUseCaseProtocol {
    
    func invoke(_ body: FlashSaleProductsRequest) -> AnyPublisher<Resource<Products>, Never> 

}
