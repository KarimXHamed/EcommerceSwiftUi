//
//  Mapper.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//

protocol Mapper {
    associatedtype Domain
    associatedtype DTO

    func dtoToDomain(dto: DTO) -> Domain

}
