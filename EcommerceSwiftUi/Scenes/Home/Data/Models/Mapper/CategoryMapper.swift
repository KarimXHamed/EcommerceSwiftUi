//
//  CategoriesListMapper.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Foundation

struct CategoriesListMapper: Mapper {
    
    func dtoToDomain(dto: [String]) -> CategoriesList {
        return CategoriesList(list: dto)
    }
}
