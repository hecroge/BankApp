//
//  TransactionsRouter.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Foundation

public enum TransactionsRouter: NetworkCall {

case getTransactions

    var path: String {
        switch self {
        case .getTransactions:
            return Endpoints.getTransactions
        }
    }

    var method: String {
        switch self {
        case .getTransactions:
            return "GET"
        }
    }

    var headers: [String : String]? {
        switch self {
        case .getTransactions:
            return ["Accept": "application/json", "Content-Type": "application/json"]
        }
    }

    func body() throws -> Data? {
        return nil
    }
}
