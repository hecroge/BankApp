//
//  Transaction.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Foundation

struct Transaction: Decodable {
    let id: Int
    let date: String
    let amount: Double
    let fee: Double
    let description: String
}
