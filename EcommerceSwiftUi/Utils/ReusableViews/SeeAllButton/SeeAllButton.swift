//
//  SeeAllButton.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 19/06/2025.
//
import SwiftUI

struct SeeAllButton: View {
    
    var action: () -> Void
    
    var body: some View {
        
        Text("See all")
            .font(Fonts.regular.getFont(size: 16))
            .foregroundStyle(.gray)
            .padding(.trailing, 2)
       
        Button {
            
            action()
            
        }
        label: {
            Icons.rightArrow.imageTemplate
                .resizable()
                .scaledToFit()
                .frame(width: 7, height: 7)
                .foregroundStyle(.black)
                .fontWeight(.black)
        }
        .frame(width:27,height: 27)
        .background(Circle().fill(Color.ter))
        .padding(.trailing, 10)
    }
    
}
