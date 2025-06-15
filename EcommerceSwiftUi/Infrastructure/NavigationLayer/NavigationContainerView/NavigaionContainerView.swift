//
//  NavigaionContainerView.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 22/05/2025.
//
import SwiftUI

struct NavigationContainerView<Content:View>: View {
    @StateObject var navigationRouter = NavigationRouter()

    var root: () -> Content
    
    var body: some View {
        NavigationStack(path: $navigationRouter.navigationPath) {
            root()
                .navigationDestination(for: AnyNavigationContainer.self) { container in
                    container.view()
                        .navigationBarBackButtonHidden(true) 

                }
        }
        .alert(
            Text(navigationRouter.alertModel.title),
            isPresented: $navigationRouter.alertModel.shouldShowAlert,
            actions: { ForEach(navigationRouter.alertModel.action){ action in
                action.button()
            }
            },
            message: {
                Text(navigationRouter.alertModel.message)
            }
        )
        .sheet(isPresented: $navigationRouter.hasPresentedSheet, onDismiss: {
            navigationRouter.dismissSheet()
            
        }, content: {
            if let currentSheet = navigationRouter.currentSheet {
                currentSheet.view()
                    .presentationDetents(navigationRouter.defaultSheetDetents)
            }
            
        } )
        .fullScreenCover(item: $navigationRouter.presentedFullScreen) { container in
            container.view()
        }

    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
    
    func eraseToAnyNavigationContainer() -> AnyNavigationContainer {
        return .init(id: UUID(), view: { self.eraseToAnyView() } )
    }
    
}
