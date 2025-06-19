//
//  HomeDI.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Factory

extension Container {
    
    static func homeServiceDi(navigationRouter:NavigationRouter) -> AnyNavigationContainer {
        
        let router = HomeRouter(navigationRouter: navigationRouter)
        let viewModel = HomeViewModel(router: router)
        let view = HomeView<HomeViewModel>(viewModel: viewModel)
        
        return view.eraseToAnyNavigationContainer()
        
    }
    
    
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
    
    var getCategoriesListUseCase: Factory<GetCategoriesListUseCaseProtocol> {
        self { GetCategoriesListUseCase() }
    }
    
    var getFlashSaleProductsUseCase: Factory<GetFlashSaleProductsUseCaseProtocol> {
        self {GetFlashSaleProductsUseCase()}
    }
    
}
