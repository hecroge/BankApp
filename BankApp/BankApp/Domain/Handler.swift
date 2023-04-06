//
//  Handler.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Foundation

enum DomainError: Error {
    case persistence
    case locationNotAllowed
}

typealias Handler<T> = (Result<T, DomainError>) -> Void
