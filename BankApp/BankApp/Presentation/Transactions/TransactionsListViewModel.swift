//
//  TransactionsListViewModel.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Foundation
import Combine

protocol TransactionsListViewModelOutput: ObservableObject {}

protocol TransactionsListViewModelInput: ObservableObject {}

protocol TransactionsListViewModelProtocol: TransactionsListViewModelOutput,
                                            TransactionsListViewModelInput {}

class TransactionsListViewModel: TransactionsListViewModelProtocol {
    
}
