//
//  ProductReusableView.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 18/06/2025.
//
import SwiftUI

struct ProductReusableView: View {
   
    @Binding var model: ProductReusableViewModel
    
    var body: some View {
        VStack(spacing: 0){
            topView
            
            bottomView
        }
        .frame(width: 170)
      
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
                
                model.isLiked.toggle()
                
            } label: {
                
                if model.isLiked {
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
    
    var topView: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.ter)
            
            ImageLoader(url: model.productImage)
            
            heartView
            
              
        }
        .frame(height: 170)
    }
    
    var bottomView: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text(model.productTitle)
                .font(Fonts.bold.getFont(size: 14))
            
            priceStack
                .padding(.top, 10)
        }
        .padding(.top, 5)
        
        
    }
    
    var priceStack: some View {
        HStack(spacing: 0) {

            Text(String(format: "£%.2f", model.currentPrice))
                .font(Fonts.bold.getFont(size: 16))
                .foregroundColor(.primary)
                .padding(.trailing, 8)
            
            Text(String(format: "£%.2f", model.priceBeforeDiscount))
                .font(Fonts.medium.getFont(size: 12))
                .foregroundColor(.gray)
                .strikethrough(true, color: .gray)
            
            Spacer()

        }
    }

    
    
}
