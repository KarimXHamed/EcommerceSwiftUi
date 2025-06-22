//
//  ProductMapper.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
import Factory

struct ProductMapper: Mapper {
    @Injected(\.reviewMapper) private var reviewMapper: ReviewMapper
    
    func dtoToDomain(dto: ProductsDTO) -> Products {
        let mappedProducts = (dto.products ?? []).map { mapProduct(dto: $0)}
        
        return .init(products: mappedProducts)
    }
    
    private func mapProduct(dto:ProductDTO) -> Product {
        
        return Product(id: dto.id ?? -1,
                       title: dto.title ?? "",
                       description: dto.description ?? "",
                       price: dto.price ?? -1,
                       discountPercentage: dto.discountPercentage ?? -1,
                       rating: dto.rating ?? -1,
                       reviews: dto.reviews?.map {reviewMapper.dtoToDomain(dto: $0)} ?? [],
                       images: dto.images ?? [],
                       thumbnail: dto.thumbnail ?? "")
        
    }
    
}
