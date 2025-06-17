//
//  GetFlashSaleProductsUseCase.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 17/06/2025.
//
import Foundation
import Combine
import Factory

class GetFlashSaleProductsUseCase: BaseUseCase<FlashSaleProductsRequest,Products> {
    
    @Injected(\.homeRepository) private var repository: HomeRepositoryProtocol
    
    override func invoke(_ body: FlashSaleProductsRequest) -> AnyPublisher<Resource<Products>, Never> {
        return execute {
            self.repository.getFlashSaleProducts(request: body)
        }
    }
    
}
