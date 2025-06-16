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
        return execute { //Cannot convert value of type '() -> AnyPublisher<CategoriesList, LeonException>' to expected argument type '() -> AnyPublisher<CategoriesList, any Error>'
            self.repository.getCategoriesList(request: body)
        }
    }
}
