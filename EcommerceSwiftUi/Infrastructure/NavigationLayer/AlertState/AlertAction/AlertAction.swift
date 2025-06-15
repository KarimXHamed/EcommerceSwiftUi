//
//  AlertAction.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 26/05/2025.
//
import SwiftUI
struct AlertAction: Identifiable, Hashable {
    var id: UUID = UUID()

    var title: String
    
    var action : () -> Void

    var actionType: AlertActionType

    func button() -> Button<Text> {
        return Button(title, role: actionType.role() , action: action)
    }

    static func == (lhs: AlertAction, rhs: AlertAction) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}
