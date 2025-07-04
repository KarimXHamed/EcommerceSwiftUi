//
//  HomeRepository.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Factory
import Combine
class HomeRepository:HomeRepositoryProtocol{
    
    //MARK: -variables
    @Injected(\.homeRemoteDS) private var remoteDS: HomeRemoteDSProtocol
    @Injected(\.productMapper) private var productMapper: ProductMapper
    @Injected(\.categoriesListMapper) private var categoryMapper: CategoriesListMapper
    
    //MARK: -Properties
    func getCategoriesList(request: CategoriesRequest) -> AnyPublisher<CategoriesList, Error> {
        Deferred {
            Future<CategoriesList, Error> { [weak self] promise in
                guard let self = self else {
                    return
                }
                
                remoteDS.getCategoriesList(request: request) { result in
                    
                    switch result {
                        
                    case .success(let dto):
                        let domainModel = self.categoryMapper.dtoToDomain(dto: dto)
                        promise(.success(domainModel))
                        
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    
    
    
    func getFlashSaleProducts(request: FlashSaleProductsRequest) -> AnyPublisher<Products, Error> {
        Deferred {
            Future<Products, Error> { [weak self] promise in
                guard let self = self else {
                    return
                }
                
                self.remoteDS.getFlashSaleProducts(request: request) { result in
                    switch result {
                    case .success(let productsDto):
                        let mappedProducts = self.productMapper.dtoToDomain(dto: productsDto)
                        promise(.success(mappedProducts))
                        
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
}
