//
//  TransactionsListItemViewModel.swift
//  BankApp
//
//  Created by Héctor Rogel on 8/4/23.
//

import Foundation

struct TransactionsListItemViewModel: Identifiable, Hashable, Equatable {
    var id: Int = 0
    var isIncome: Bool = true
    var amount: Double = 0.0
    var description: String = ""
    var date: Date?

    static func == (left: TransactionsListItemViewModel, right: TransactionsListItemViewModel) -> Bool {
        return left.id == right.id
    }
}

extension TransactionsListItemViewModel {
    init(transaction: Transaction) {
        self.id = transaction.id
        self.amount = transaction.amount + (transaction.fee ?? 0.0)
        self.isIncome = self.amount > 0
        self.description = transaction.description ?? ""
        self.date = transaction.date.toDate()
    }
}
