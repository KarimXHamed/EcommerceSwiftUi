//
//  HomeRemoteDS.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Factory

class HomeRemoteDS: HomeRemoteDSProtocol {
    
    //MARK: -variables
    
    @Injected(\.networkProvider) private var networkProvider: NetworkProviederProtocol
    private var categoriesListTask: Task<Void, Never>?
    private var flashSaleProductsTask: Task<Void, Never>?
    
    //MARK: -properties
    
    func getCategoriesList(request: CategoriesRequest, completion: @escaping(Result<[String],Error>)-> Void) {
      
        doNetworkTask(task: &categoriesListTask,
                      request: request,
                      model: [String].self) { result in
            completion(result)
        }
        
        
    }
    
    func getFlashSaleProducts(request: FlashSaleProductsRequest, completion: @escaping(Result<ProductsDTO,Error>)-> Void) {
       
        doNetworkTask(task: &flashSaleProductsTask,
                      request: request,
                      model: ProductsDTO.self) { result in
            completion(result)
        }
        
    }
    
    private func doNetworkTask<T:Codable>(task: inout Task<Void, Never>?,
                                          request:EndpointProtocol,
                                          model: T.Type,
                                          completion: @escaping(Result<T,Error>)-> Void) {
        task = Task {
            do {
                let networkSuccess = try await networkProvider.get(endpoint: request, model: T.self)
                
                if Task.isCancelled {
                    return
                }
                
                completion(.success(networkSuccess))
                
            } catch {
                
                completion(.failure(error))
                
            }
        }
    }
    
    private func cancelOnGoingTask(task: Task<Void, Never>) {
        categoriesListTask?.cancel()
        flashSaleProductsTask?.cancel()
    }
}
