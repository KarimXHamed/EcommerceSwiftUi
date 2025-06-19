//
//  Approuter.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 19/06/2025.
//
import SwiftUI
import Factory

class AppRouter {
    
    @AppStorage("accessToken") private var accessToken:Bool = false
    func start(navigationRouter:NavigationRouter) -> AnyNavigationContainer {
        return Container.homeServiceDi(navigationRouter: navigationRouter)
        
        
    }
}
