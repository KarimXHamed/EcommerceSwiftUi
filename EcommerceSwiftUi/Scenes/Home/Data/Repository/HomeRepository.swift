//
//  HomeRepository.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Factory
import Combine
class HomeRepository: HomeRepositoryProtocol {
    
    //MARK: -variables
    @Injected(\.homeRemoteDS) private var remoteDS: HomeRemoteDSProtocol
    @Injected(\.productMapper) private var productMapper: ProductMapper
    @Injected(\.categoriesListMapper) private var categoryMapper: CategoriesListMapper
    
    //MARK: -Properties
    func getCategoriesList(request: CategoriesRequest) -> AnyPublisher<CategoriesList, LeonException> {
        Deferred {
            Future<CategoriesList, LeonException> { [weak self] promise in
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
    
    
    
    
    func getFlashSaleProducts(request: FlashSaleProductsRequest) -> AnyPublisher<[Product], LeonException> {
        Deferred {
            Future<[Product], LeonException> { [weak self] promise in
                guard let self = self else {
                    return
                }
                
                self.remoteDS.getFlashSaleProducts(request: request) { result in
                    switch result {
                    case .success(let productsDto):
                        let mappedProducts = productsDto.map { self.productMapper.dtoToDomain(dto: $0) }
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
