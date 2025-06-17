//
//  HomeRemoteDSProtocol.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
protocol HomeRemoteDSProtocol {
    
    func getCategoriesList(request: CategoriesRequest, completion: @escaping(Result<[String],Error>)-> Void)
    
    func getFlashSaleProducts(request: FlashSaleProductsRequest, completion: @escaping(Result<[ProductDTO],Error>)-> Void) 
}
