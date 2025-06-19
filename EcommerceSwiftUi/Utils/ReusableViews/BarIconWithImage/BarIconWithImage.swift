//
//  BarIconWithImage.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 17/06/2025.
//
import SwiftUI

struct BarIconWithImage: View {
   
    let color: Color
    let image: Image
    let action: () -> Void
    
    var body: some View {
       
        Button {
            action()
        } label: {
            buttonLabel
        }
    

    }
    var buttonLabel: some View {
        
        ZStack {
            
            Circle()
                .fill(color)
            
            image
                .scaledToFit()
                .foregroundStyle(.black)
                .fontWeight(.medium)
              
        }
        .frame(width: 50, height: 50)
        
    }
    
}
