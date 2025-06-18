//
//  GridHeaderReusableView.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 18/06/2025.
//
import SwiftUI

struct GridHeaderReusableView: View {
    var body: some View {
        HStack {
            
            Text("Categories")
                .font(Fonts.blackItalic.getFont(size: 25))
                .padding(.leading, 10)
            
            Spacer()
        }
        .padding(.top, 10)

    }
}
