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

    func toDate(withFormat format: String = Constants.serverDateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        let date = dateFormatter.date(from: self)
        return date
    }
}
