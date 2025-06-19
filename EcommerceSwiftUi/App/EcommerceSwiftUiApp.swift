//
//  EcommerceSwiftUiApp.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 12/06/2025.
//

import SwiftUI

@main
struct EcommerceSwiftUiApp: App {
    var appRouter = AppRouter()
    
    var rootView: AnyNavigationContainer?
    
    let navigationRouter: NavigationRouter = NavigationRouter()
    
    
    init() {
        self.rootView = appRouter.start(navigationRouter: navigationRouter)
    }
    
    var body: some Scene {
        WindowGroup {
            
            NavigationContainerView(navigationRouter: navigationRouter) {
                rootView?.view()
                
            }
        }
    }
}
