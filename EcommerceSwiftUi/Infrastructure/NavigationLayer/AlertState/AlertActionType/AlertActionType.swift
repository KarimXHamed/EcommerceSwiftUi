//
//  AlertActionType.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 26/05/2025.
//
import SwiftUI

enum AlertActionType: Hashable,Identifiable {
    var id:UUID { UUID() }
    
    case destructive
    case cancel
    
    func role() -> ButtonRole {
        switch self {
        case .destructive:
            return .destructive

        case .cancel:
            return .cancel
        }
    }
    
    static func == (lhs: AlertActionType, rhs: AlertActionType) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}
