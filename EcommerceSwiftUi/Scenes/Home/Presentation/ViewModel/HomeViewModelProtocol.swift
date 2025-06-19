//
//  HomeViewModelProtocol.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 19/06/2025.
//
import Combine

protocol HomeViewModelProtocol: ObservableObject {
    var state: HomeUiState { get set }
    func onAction(_ action: HomeUiAction)
}
