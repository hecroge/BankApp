//
//  TransactionsUseCaseFactory.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Foundation

class TransactionsUseCaseFactory {
    // MARK: - Properties
    let gateway: TransactionsGateway

    // MARK: - Init
    init(gateway: TransactionsGateway) {
        self.gateway = gateway
    }

    // MARK: - Factory methods
    func getTransactions(handler: @escaping Handler<[Transaction]>) -> UseCase {
        GetTransactionsUseCase(gateway: gateway, handler: handler)
    }
}
