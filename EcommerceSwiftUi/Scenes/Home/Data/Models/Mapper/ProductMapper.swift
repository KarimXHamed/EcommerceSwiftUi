//
//  ProductMapper.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Factory

struct ProductMapper: Mapper {
    @Injected(\.reviewMapper) private var reviewMapper: ReviewMapper
    
    func dtoToDomain(dto: [ProductDTO]) -> Products {
        let mappedProducts = dto.map { mapProduct(dto: $0) }
        
        return .init(products: mappedProducts)
    }
    
    private func mapProduct(dto:ProductDTO) -> Product {
        
        return Product(id: dto.id,
                       title: dto.title,
                       description: dto.description,
                       price: dto.price,
                       discountPercentage: dto.discountPercentage,
                       rating: dto.rating,
                       reviews: dto.reviews?.map {reviewMapper.dtoToDomain(dto: $0)},
                       images: dto.images, thumbnail: dto.thumbnail)
        
    }
    
}
