//
//  DateExtension.swift
//  BankApp
//
//  Created by Héctor Rogel on 9/4/23.
//

import Foundation

extension Date {
    func toDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.appDateFormat

        return dateFormatter.string(from: self)
    }
}
