//
//  ProductDTO.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
struct ProductDTO: Codable {
    let id: Int? //MARK: -to domain
    let title: String? //MARK: -to domain
    let description: String? //MARK: -to domain
    let category: String?
    let price: Double? //MARK: -to domain
    let discountPercentage: Double? //MARK: -to domain
    let rating: Double? //MARK: -to domain
    let stock: Int?
    let tags: [String]?
    let brand: String?
    let sku: String?
    let weight: Int?
    let dimensions: DimensionsDTO?
    let warrantyInformation: String?
    let shippingInformation: String?
    let availabilityStatus: String?
    let reviews: [ReviewDTO]? //MARK: -to domain
    let returnPolicy: String?
    let minimumOrderQuantity: Int?
    let meta: MetaDTO?
    let images: [String]? //MARK: -to domain
    let thumbnail: String?//MARK: -to domain
}

struct DimensionsDTO: Codable {
    let width: Double?
    let height: Double?
    let depth: Double?
}

struct ReviewDTO: Codable {
    let rating: Int?
    let comment: String?
    let date: String?
    let reviewerName: String?
    let reviewerEmail: String?
}

struct MetaDTO: Codable {
    let createdAt: String?
    let updatedAt: String?
    let barcode: String?
    let qrCode: String?
}
