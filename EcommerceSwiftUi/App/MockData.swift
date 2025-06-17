//
//  Untitled.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 17/06/2025.
//
import SwiftUI

struct MockData {
    static var colors:[Color] {
        var array: [Color] = []
        
        for _ in 0..<30 {
            array.append(Color.random)
        }
        return array
    }
}
