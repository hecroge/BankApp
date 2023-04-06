//
//  GetTransactionsUseCase.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Combine

final class GetTransactionsUseCase {
    // MARK: - Properties
    private let gateway: TransactionsGateway
    private let handler: Handler<[Transaction]>
    private var cancellable: AnyCancellable?

    init(gateway: TransactionsGateway, handler: @escaping Handler<[Transaction]>) {
        self.gateway = gateway
        self.handler = handler
    }
}

extension GetTransactionsUseCase: UseCase {
    func execute() {
        cancellable = gateway.getTransaction().sink(receiveCompletion: { completion in
            if case .failure = completion {
                self.handler(.failure(.persistence))
            }
        }, receiveValue: { value in
            self.handler(.success(value))
        })
    }
}
