//
//  AnyNavigationContainer.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 22/05/2025.
//
import SwiftUI
class AnyNavigationContainer: Hashable,Identifiable {
    
    var id = UUID()
    var view : () -> AnyView
    init(id: UUID = UUID(), view: @escaping () -> AnyView) {
        self.id = id
        self.view = view
    }
    
    static func == (lhs: AnyNavigationContainer, rhs: AnyNavigationContainer) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}


