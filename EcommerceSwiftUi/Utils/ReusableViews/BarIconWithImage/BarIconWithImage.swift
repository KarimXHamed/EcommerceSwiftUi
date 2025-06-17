//
//  BarIconWithImage.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 17/06/2025.
//
import SwiftUI

struct BarIconWithImage: View {
    var color: Color
    var image: Image
    
    var body: some View {
       
        ZStack {
            
            Circle()
                .fill(color)
            
            image
                .clipShape(.circle)
                .background(color)
            
        }
        .frame(width: 200, height: 200)
    

    }
    
}
