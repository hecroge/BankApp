//
//  BankApp.swift
//  BankApp
//
//  Created by Héctor Rogel on 3/4/23.
//

import SwiftUI

@main
struct BankApp: App {
    var body: some Scene {
        WindowGroup {
            TransactionsListConnector().assembleModule()
        }
    }
}
