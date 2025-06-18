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
                .scaledToFit()
                .foregroundStyle(.black)
              
        }
        .frame(width: 50, height: 50)
    

    }
    
}
