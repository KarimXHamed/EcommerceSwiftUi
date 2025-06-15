//
//  BaseRouterProtocol.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 22/05/2025.
//
protocol BaseRouterProtocol {
    var navigationRouter: NavigationRouter { get set }
    
    func pop()
    
    func popToRoute()
        
    func dismissFullScreenCover()
    
    func openMail()
    
    func openURL(_ url:String)
    
}

//MARK: -defining stable functions

extension BaseRouterProtocol {
    func pop() {
        navigationRouter.pop()
    }
    
    func popToRoute() {
        navigationRouter.popToRoot()
    }
    
    func dismissFullScreenCover() {
        navigationRouter.dismissFullScreenCover()
    }
    
}
