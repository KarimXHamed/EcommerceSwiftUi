//
//  ReviewMapper.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 16/06/2025.
//
struct ReviewMapper: Mapper {
    
    func dtoToDomain(dto: ReviewDTO) -> Review {
        return Review(rating: dto.rating,
                      comment: dto.comment,
                      date: dto.date,
                      reviewerName: dto.reviewerName,
                      reviewerEmail: dto.reviewerEmail)
    }
    
}
