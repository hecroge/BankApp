//
//  TransactionsNetwork.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Foundation
import Combine

class TransactionsNetwork {
    func getTransactions() -> AnyPublisher<[Transaction], Error> {
        do {
            let url = try TransactionsRouter.getTransactions.urlRequest(baseURL: Constants.baseUrl)
            return URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .mapError { (error: URLError) -> Error in
                    return error
                }
                .decode(type: [Transaction].self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        } catch let error {
            return Fail<[Transaction], Error>(error: error).eraseToAnyPublisher()
        }
    }
}
