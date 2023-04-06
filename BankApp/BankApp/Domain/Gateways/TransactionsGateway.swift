//
//  TransactionGateway.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Combine

enum TransactionsGatewayError: Error {
    case unaccessible
    case decodingError
}

protocol TransactionsGateway {
    func getTransaction() -> AnyPublisher<[Transaction], TransactionsGatewayError>
}
