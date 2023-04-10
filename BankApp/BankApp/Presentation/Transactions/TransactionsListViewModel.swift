//
//  TransactionsListViewModel.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Foundation
import Combine

protocol TransactionsListViewModelOutput: ObservableObject {
    var transactions: [TransactionsListItemViewModel] { get set }
    var firstTransaction: TransactionsListItemViewModel { get set }
    func getTransactions()
}

protocol TransactionsListViewModelInput: ObservableObject {
    func reverseTransactions()
}

protocol TransactionsListViewModelProtocol: TransactionsListViewModelOutput,
                                            TransactionsListViewModelInput {}

class TransactionsListViewModel: TransactionsListViewModelProtocol {
    @Published var transactions: [TransactionsListItemViewModel] = []
    @Published var firstTransaction: TransactionsListItemViewModel = TransactionsListItemViewModel()
    private let useCaseFactory: TransactionsUseCaseFactory
    private var useCase: UseCase?

    // MARK: - Init
    init(useCaseFactory: TransactionsUseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }

    // MARK: - Input functions
    func getTransactions() {
        executeGetTransactionsUseCase()
    }

    // MARK: - Output functions
    func reverseTransactions() {
        transactions = transactions.reversed()
    }

    // MARK: - Private functions
    private func executeGetTransactionsUseCase() {
        useCase = useCaseFactory.getTransactions(handler: { result in
            if case .success(let response) = result {
                DispatchQueue.main.async {
                    let noDuplicates = response.map { TransactionsListItemViewModel(transaction: $0) }
                        .filter { $0.date != nil }
                    self.transactions = Array(Dictionary(noDuplicates.map { ($0.id, $0) },
                                          uniquingKeysWith: { $0.date ?? Date() > $1.date ?? Date() ? $0 : $1 }).values)
                    .sorted(by: { $0.date ?? Date() > $1.date ?? Date() })

                    self.firstTransaction = self.transactions[0]
                }
                self.useCase = nil
            }
        })
        useCase?.execute()
    }
}
