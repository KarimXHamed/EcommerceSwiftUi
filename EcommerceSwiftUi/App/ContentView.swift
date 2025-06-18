//
//  ContentView.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 12/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State var isLiked = false
    let colomns = Array(repeating: GridItem(.flexible()), count: 3)
    let rows = Array(repeating: GridItem(.fixed(100)), count: 3)
    
    
    var body: some View {
        
        
        HStack{
            Spacer()
            
            ProductReusableView(productImage: Icons.bell.imageOriginal,
                                isLiked: $isLiked)
                .padding(.top, 5)
        }
        
        
    }
    
    
    
    
    
}

#Preview {
    ContentView()
}
