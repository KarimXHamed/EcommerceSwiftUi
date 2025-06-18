//
//  CategoryView.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 18/06/2025.
//
import SwiftUI

struct CategoryView: View {
    
    var categoryImage: String
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .fill(Color.ter)
            
            Text(categoryImage)
                .font(.title.bold())
                .foregroundStyle(.black)
            
              
        }
        .frame(width: 70, height: 70)
    }
    
} 
#Preview {
    CategoryView(categoryImage: "📱")
}
