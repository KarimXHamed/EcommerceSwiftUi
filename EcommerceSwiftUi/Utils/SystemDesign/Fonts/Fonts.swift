//
//  Fonts.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 15/06/2025.
//
import SwiftUI

enum Fonts {
    case regular, ultraLightItalic, thinItalic, lightItalic, medium, semiBoldItalic, bold, heavyItalic, blackItalic
    
    func getFont(size:CGFloat) -> Font {
        
        
        switch self {
        case .regular:
            return Font.custom("SFProDisplay-Regular", size: size)
            
        case .ultraLightItalic:
            return Font.custom("SFProDisplay-UltralightItalic", size: size)
            
        case .thinItalic:
            return Font.custom("SFProDisplay-ThinItalic", size: size)
            
        case .lightItalic:
            return Font.custom("SFProDisplay-LightItalic", size: size)
            
        case .medium:
            return Font.custom("SFProDisplay-Medium", size: size)
            
        case .semiBoldItalic:
            return Font.custom("SFProDisplay-SemiboldItalic", size: size)
            
        case .bold:
            return Font.custom("SFProDisplay-Bold", size: size)
            
        case .heavyItalic:
            return Font.custom("SFProDisplay-HeavyItalic", size: size)
            
        case .blackItalic:
            return Font.custom("SFProDisplay-BlackItalic", size: size)
            
        }
    }
}
