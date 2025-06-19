//
//  HomeViewModel.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 19/06/2025.
//
import Foundation
import Combine
import Factory

class HomeViewModel: HomeViewModelProtocol {
    
    @Published var state: HomeUiState = .init()
    private var router:HomeRouterProtocol
    private var cancellables = Set<AnyCancellable>()
    @Injected(\.getCategoriesListUseCase) private var getCategoriesUseCase: GetCategoriesListUseCaseProtocol
    
    init( router: HomeRouterProtocol) {
        self.router = router
    }
    
    func onAction(_ action: HomeUiAction) {
        
        switch action {
            
        case .onProductPressed:
            router.goToProduct()
            
        case .onCategoryPressed:
            router.goToCategory()
            
        case .searchClicked:
            router.search()
            
        case .notificationsClicked:
            router.goToNotifications()
            
        case .settingsClicked:
            router.goToSettings()
        case .onAppear:
            onAppear()
        }
        
    }
    
    private func onAppear() {
        fetchCategories()
    }
    
    private func fetchCategories() {
        
        let body = CategoriesRequest()
        
        getCategoriesUseCase.invoke(body)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] resource in
                
                guard let self = self else { return }
                
                switch resource {
                case .success(let categories):
                    state.categories = categories
                    
                case .loading(let isLoading):
                    print(isLoading)
                    state.isLoading = isLoading
                    
                case .failure(_):
                    showAlert()
                }
                
            })
            .store(in: &cancellables)
        
    }
    
    private func showAlert() {
        print("show alert")
    }
    
    
}
