//
//  HomeUiState.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 19/06/2025.
//
struct HomeUiState {
    
    var isLoading: Bool = false
    var hasNotifications: Bool = true
    var categories: CategoriesList = .init(list: [])
    var products: [ProductReusableViewModel] = []
    var searchText: String = ""
    
}
