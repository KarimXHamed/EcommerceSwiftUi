//
//  GetCategoriesListUseCaseProtocol.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Combine

protocol GetCategoriesListUseCaseProtocol {
    func invoke(_ body: CategoriesRequest) -> AnyPublisher<Resource<CategoriesList>, Never>
}
