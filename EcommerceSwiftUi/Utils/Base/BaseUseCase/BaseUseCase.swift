//
//  BaseUseCase.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 21/05/2025.
//
import Combine
class BaseUseCase<Body:EndpointProtocol,Domain:Model>: BaseUseCaseProtocol {
    
    typealias Body = Body
    
    typealias Domain = Domain
    
    var cancellables = Set<AnyCancellable>()

    
    func invoke(_ body: Body) -> AnyPublisher<Resource<Domain>,Never> {
        fatalError("must be overriden by class")
        
    }
    
    func execute(_ codeBlock: @escaping () -> AnyPublisher<Domain,Error>) -> AnyPublisher<Resource<Domain>, Never> {
        
        let subject = CurrentValueSubject<Resource<Domain>, Never>(.loading(true))
        
        codeBlock()
            .map{ Resource.success($0) }
            .catch { error -> Just<Resource<Domain>> in
                let failure = (error as? LeonException) ?? LeonException.unknown(.unknown)
                return Just(.failure(failure))
            }
            .handleEvents(
            receiveCompletion: { _ in
                subject.send(.loading(false))
                subject.send(completion: .finished)
            }
            )
            .sink(receiveValue: { resource in
                subject.send(resource)
            })
            .store(in: &cancellables)
        return subject.eraseToAnyPublisher()
    }
}
