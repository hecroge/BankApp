//
//  TransactionsListConnector.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import SwiftUI

protocol TransactionsListConnectorProtocol {}

final class TransactionsListConnector: TransactionsListConnectorProtocol {
    // MARK: - Init
    init() {}

    // MARK: - Dependency injection
    func assembleModule() -> some View {
        let gateway = TransactionRepository(network: TransactionsNetwork())
        let useCaseFactory = TransactionsUseCaseFactory(gateway: gateway)
        let viewModel = TransactionsListViewModel(useCaseFactory: useCaseFactory)
        return AnyView(TransactionsListView(viewModel: viewModel, connector: self))
    }
}
