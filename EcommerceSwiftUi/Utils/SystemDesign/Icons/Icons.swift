//
//  Icons.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 17/06/2025.
//
import SwiftUI

enum Icons:String {
    
    case gear
    case bell
    case heart
    case heartFill = "heart.fill"
    case rightArrow = "chevron.right"
    case searchIcon = "magnifyingglass"

    
}

extension Icons {
    var imageOriginal:Image {
        
        if UIImage(systemName: self.rawValue) != nil {
             return Image(systemName: self.rawValue)
                .renderingMode(.original)
         } else {
             return Image(self.rawValue)
                 .renderingMode(.original)
         }
        
    }
    var imageTemplate:Image {
        
        if UIImage(systemName: self.rawValue) != nil {
             return Image(systemName: self.rawValue)
                 .renderingMode(.template)
         } else {
             return Image(self.rawValue)
                 .renderingMode(.template)
         }
        
 
    }
}
