//
//  CategoryView.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 18/06/2025.
//
import SwiftUI

struct CategoryView: View {
    
    let categoryName: String
    let categoryImage: String = "📱"
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            iconStack
            
            Text(categoryName)
                .font(Fonts.medium.getFont(size: 12))
                .padding(.top, 11)
            
        }

    }
    
    var iconStack: some View {
 
        ZStack {
            
            Circle()
                .fill(Color.ter)
            
            Text(categoryImage)
                .font(Fonts.bold.getFont(size: 22))
              
        }
        .frame(width: 65, height: 65)
        
    }
    
} 
