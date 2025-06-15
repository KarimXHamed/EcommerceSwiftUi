//
//  ContentView.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 12/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                getCategories()
            } label: {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
            Text("Hello, world!")
                .font(Fonts.semiBoldItalic.getFont(size: 30))
        }
        .padding()
    }
    
}

func getCategories() {
    let network = NetworkProvider()
    network.get(endPoint: CategoriesRequest(), model: [Category].self)
}

#Preview {
    ContentView()
}
