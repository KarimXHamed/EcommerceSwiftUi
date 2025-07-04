//
//  GridHeaderReusableView.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 18/06/2025.
//
import SwiftUI

struct GridHeaderReusableView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            
            Text(title)
                .font(Fonts.bold.getFont(size: 28))
                .padding(.leading, 10)
            
            Spacer()
                        
            
            
            SeeAllButton() {
                action()
            }
            
            
            
        }
        .padding(.top, 10)

    }
}
