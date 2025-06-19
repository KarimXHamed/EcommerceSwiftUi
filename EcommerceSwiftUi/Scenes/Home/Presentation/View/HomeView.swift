//
//  HomeView.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 19/06/2025.
//
import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        
        ZStack{
            Color.ter
            
            VStack(spacing: 10){
                topView
                bottomView
                Spacer()
            }
            
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.onAction(.onAppear)
        }
        
    }
    
    var topBar: some View {
        
        HStack(spacing: 0) {
            
            BarIconWithImage(color: .prim,
                             image: Icons.gear.imageTemplate) {
                
                viewModel.onAction(.settingsClicked)
                
            }
            
            Spacer()
            
            addressStack
            
            Spacer()
            
            BarIconWithImage(color: .ter,
                             image: Icons.bell.imageTemplate) {
                
                viewModel.onAction(.notificationsClicked)
                
            }
                             .overlay(
                                notificationCircle,
                                alignment: .topTrailing
                             )
            
            
        }
        
        
    }
    
    var topView: some View {
        VStack(spacing: 15) {
            
            topBar
            CustomSearchBar(searchText: $viewModel.state.searchText)
            gradientView
            //.padding(.bottom, 15)
            
        }
        .padding(20)
        .padding(.top,35)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
        )
    }
    
    var bottomView: some View {
        
        VStack(spacing: 15) {
            categoriesGrid
            Spacer()
        
            
        }
        
        .padding(20)
        .padding(.bottom,35)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
        )
        
    }
    
    var categoriesGrid: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: [GridItem( .fixed(100) )] ) {
                Section {
                    ForEach(viewModel.state.categories.list , id: \.self) { model in
                        CategoryView(categoryName: model)
                        
                    }
                } header: {
                    GridHeaderReusableView(title: "Categories") {
                        viewModel.onAction(.onCategoryPressed)
                    }
                }
            }
        }
    }
    
    var gradientView: some View {
        HStack(spacing: 0) {
            
            Text("Delivery is")
                .padding(.leading, 10)
                .padding(.trailing, 5)
                .font(Fonts.bold.getFont(size: 16))
            
            Text("50%")
                .padding(8)
                .font(Fonts.bold.getFont(size: 16))
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.white)
                )
            
            Text("cheaper")
                .font(Fonts.bold.getFont(size: 16))
                .padding(.leading, 5)
            
            
            Spacer()
            
        }
        .frame(height: 48)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill( .sec.gradient )
        )
    }
    
    var addressStack: some View {
        
        VStack(spacing: 0) {
            Text("Delivery address")
                .font(Fonts.medium.getFont(size: 12))
                .foregroundStyle(.gray)
            
            Text("92 High Street, London")
                .font(Fonts.bold.getFont(size: 16))
            
            
        }
        
    }
    
    var notificationCircle: some View {
        
        ZStack {
            if viewModel.state.hasNotifications {
                Circle()
                    .fill(Color.sec)
                    .frame(width: 13, height: 13)
                    .overlay(Circle()
                        .stroke(Color.white, lineWidth: 2))
                
            }
        }
        
    }
    
}
