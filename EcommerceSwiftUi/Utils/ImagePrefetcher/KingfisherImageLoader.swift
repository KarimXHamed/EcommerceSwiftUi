//
//  KingfisherImageLoader.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 22/06/2025.
//
import Kingfisher
import SwiftUI

struct KingfisherImageLoader: View {
    var placeholder: Image 
    let url: String
    var contentMode: SwiftUI.ContentMode
    
    var body: some View {
        KFImage(URL(string: url))
            .placeholder {
                placeholder
            }
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
    
    
}
