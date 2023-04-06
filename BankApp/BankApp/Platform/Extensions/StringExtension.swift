//
//  StringExtension.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
