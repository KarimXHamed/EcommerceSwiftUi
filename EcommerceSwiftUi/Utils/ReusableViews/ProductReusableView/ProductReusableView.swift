//
//  ProductReusableView.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 18/06/2025.
//
import SwiftUI

struct ProductReusableView: View {
    
    var productImage: Image
    @Binding var isLiked: Bool
    
    var body: some View {
      
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.ter)
            
           productImage
            
            heartView
            
              
        }
        .frame(width: 180, height: 180)
    }
    
    var heartView: some View {
        VStack(spacing: 0) {
            
            heartButton
          
            Spacer()
            
        }
    }
    
    var heartButton: some View {
        
        HStack(spacing: 0) {
            Spacer()

            
            Button {
                
                isLiked.toggle()
                
            } label: {
                
                if isLiked {
                    Icons.heartFill.imageOriginal
                } else {
                    Icons.heart.imageTemplate
                        .foregroundStyle(.gray)
                }
                
            }
            .frame(width:30,height: 30)
            .background(Circle().fill(Color.white))
            .padding(.top, 20)
            .padding(.trailing, 15)
            
        }
        
    }
    
    
}
