//
//  CGFloat+Ext.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 22/06/2025.
//
import SwiftUI

extension CGFloat {
    static var topSafeAreaInset: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?.safeAreaInsets.top ?? 0
    }
}


