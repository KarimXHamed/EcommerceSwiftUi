//
//  HomeDI.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Factory

extension Container {
    
    var reviewMapper: Factory<ReviewMapper> {
        self {ReviewMapper()}
    }
    
    var productMapper: Factory<ProductMapper> {
        self {ProductMapper()}
    }
    
    var categoriesListMapper: Factory<CategoriesListMapper> {
        self {CategoriesListMapper()}
    }
    
    var homeRemoteDS: Factory<HomeRemoteDSProtocol> {
        self {HomeRemoteDS()}
    }
}
