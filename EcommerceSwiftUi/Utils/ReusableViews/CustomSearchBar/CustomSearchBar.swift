//
//  CustomSearchBar.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 19/06/2025.
//
import SwiftUI

struct CustomSearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack( spacing: 0) {
            Spacer()
            
            Icons.searchIcon.imageTemplate
                .foregroundStyle(.gray)
                .padding(.trailing, 5)
            
            TextField("Search the entire shop", text: $searchText)
                .font(Fonts.medium.getFont(size: 16))
                .foregroundStyle(.gray)

            Spacer()

        }
        .padding(.horizontal, 70)
        .frame(height: 48)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ter)
        )
        
    }
    
}
