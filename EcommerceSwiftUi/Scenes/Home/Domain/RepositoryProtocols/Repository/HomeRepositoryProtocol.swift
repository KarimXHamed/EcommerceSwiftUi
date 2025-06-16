//
//  HomeRepositoryProtocol.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Combine

protocol HomeRepositoryProtocol {
    
    func getCategoriesList(request: CategoriesRequest) -> AnyPublisher<CategoriesList, LeonException>

    func getFlashSaleProducts(request: FlashSaleProductsRequest) -> AnyPublisher<[Product], LeonException>

    
}
