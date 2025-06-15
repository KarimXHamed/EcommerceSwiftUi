//
//  NavigationRouter.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 22/05/2025.
//
import SwiftUI

class NavigationRouter:ObservableObject {
    @Published var navigationPath: NavigationPath = NavigationPath()
  
    @Published private var pathKeys: [AnyHashable] = []
    
    @Published var currentSheet: AnyNavigationContainer?
   
    private var sheetStack: [AnyNavigationContainer]? = []
    
    @Published var presentedFullScreen: AnyNavigationContainer?
    
    @Published var hasPresentedSheet:Bool = false
    
    var defaultSheetDetents: Set<PresentationDetent> = [.medium]
    
    @Published var alertModel: AlertModel = AlertModel()
    
}

//MARK: -responsible for main navigation operations
extension NavigationRouter {
    func push(_ path:AnyNavigationContainer) {
        navigationPath.append(path)
        pathKeys.append(path.id)
    }
    
    func pop() {
        navigationPath.removeLast()
    }
    
    func popToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
    
}

//MARK: -Sheet presentation

extension NavigationRouter {
    func presentSheet(_ sheet:AnyNavigationContainer) {
        sheetStack?.append(sheet)
        currentSheet = sheet
        hasPresentedSheet = true
    }
    
    func dismissSheet() {
        guard var sheetStack , !sheetStack.isEmpty , currentSheet != nil else { return }
        
        sheetStack.removeLast()
        self.currentSheet = currentSheet
        
        if sheetStack.isEmpty {
            currentSheet = nil
            hasPresentedSheet = false
            return
        }
        
        currentSheet = sheetStack.last
        hasPresentedSheet = true
    }
}

//MARK: -Full Screen Cover Presentaion

extension NavigationRouter {
    func presentFullScreenCover(_ content:AnyNavigationContainer) {
        presentedFullScreen = content
    }
    
    func dismissFullScreenCover() {
        presentedFullScreen = nil
    }
    
}

//MARK: -Alert Presentation
extension NavigationRouter {
    func showAlert(_ model:AlertModel) {
        alertModel.title = model.title
        alertModel.message = model.message
        alertModel.action = model.action
        alertModel.shouldShowAlert = true
        
    }
}

