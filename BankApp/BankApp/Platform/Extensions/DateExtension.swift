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
        dateFormatter.dateFormat = "dd/MM/YYYY"

        return dateFormatter.string(from: self)
    }
}
