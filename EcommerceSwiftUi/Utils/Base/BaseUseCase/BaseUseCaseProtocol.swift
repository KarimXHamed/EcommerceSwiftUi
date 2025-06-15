//
//  BaseUseCaseProtocol.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 21/05/2025.
//
import Combine
protocol BaseUseCaseProtocol {
    associatedtype Body
    associatedtype Domain:Model
    
    var cancellables:Set<AnyCancellable> {get set}
    
    func invoke(_ body:Body) -> AnyPublisher<Resource<Domain>,Never>
    
    func execute(_ codeBlock: @escaping () -> AnyPublisher<Domain,Error>)
    -> AnyPublisher<Resource<Domain>,Never>
    
    
}
