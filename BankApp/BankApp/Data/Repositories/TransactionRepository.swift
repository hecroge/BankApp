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
