//
//  GetCategoriesListUseCase.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Factory
import Combine
import Foundation

class GetCategoriesListUseCase: BaseUseCase<CategoriesRequest,CategoriesList>, GetCategoriesListUseCaseProtocol {
    
    //MARK: - Variables
    @Injected(\.homeRepository) private var repository: HomeRepositoryProtocol
    
    //MARK: -Functions
    override func invoke(_ body: CategoriesRequest) -> AnyPublisher<Resource<CategoriesList>, Never> {
        return execute {
            self.repository
                        .getCategoriesList(request: body)
                    
        }
    }
}
