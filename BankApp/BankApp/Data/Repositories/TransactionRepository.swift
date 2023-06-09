//
//  TransactionRepository.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Foundation
import Combine

final class TransactionRepository {
    // MARK: - Properties
    private var cancellable: AnyCancellable?
    private var network: TransactionsNetwork

    // MARK: - Init
    init(network: TransactionsNetwork) {
        self.network = network
    }
}

extension TransactionRepository: TransactionsGateway {
    func getTransaction() -> AnyPublisher<[Transaction], TransactionsGatewayError> {
        Future<[Transaction], TransactionsGatewayError> { [weak self] promise in
            self?.cancellable = self?.network.getTransactions().sink(receiveCompletion: { completion in
                if case .failure = completion {
                    return promise(.failure(.unaccessible))
                }
            }, receiveValue: { result in
                return promise(.success(result))
            })
        }.eraseToAnyPublisher()
    }
}
