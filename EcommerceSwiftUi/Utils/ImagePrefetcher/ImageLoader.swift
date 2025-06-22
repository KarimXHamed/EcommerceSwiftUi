//
//  ImageLoader.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 22/06/2025.
//
import SwiftUI

struct ImageLoader: View {
    var placeholder: Image = Icons.placeholder.imageOriginal
    let url: String
    let contentMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                KingfisherImageLoader(placeholder: placeholder,
                                      url: url,
                                      contentMode: contentMode)
            }
            .clipped()
    }
    
}
