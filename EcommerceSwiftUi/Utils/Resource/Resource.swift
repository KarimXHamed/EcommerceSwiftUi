//
//  Resource.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 21/05/2025.
//

enum Resource<PartialData:Model>  {
    
    case success(PartialData)
    case loading(Bool)
    case failure(LeonException)
    
}

