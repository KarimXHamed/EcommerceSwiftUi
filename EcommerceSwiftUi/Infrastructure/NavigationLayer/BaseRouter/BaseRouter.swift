//
//  BaseRouter.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 22/05/2025.
//
import SwiftUI

class BaseRouter: BaseRouterProtocol {
    
    @ObservedObject var navigationRouter: NavigationRouter
    
    let app = UIApplication.shared
    
    
    init(navigationRouter: NavigationRouter) {
        self.navigationRouter = navigationRouter
    }
    
    
    func openMail() {
        ///perform mail sending here
    }
    
    func openURL(_ url: String) {
        if let url = URL(string: url) , app.canOpenURL(url) {
            app.open(url)
        }
    }
}
