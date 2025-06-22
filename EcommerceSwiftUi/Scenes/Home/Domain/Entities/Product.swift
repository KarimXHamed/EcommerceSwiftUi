//
//  Product.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
struct Product: Model {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let reviews: [Review]
    let images: [String]
    let thumbnail: String
}

struct Review: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String
}
