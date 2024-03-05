//
//  Date+Extension.swift
//  News
//
//  Created by Avnish Kumar 02/01/24.
//

import Foundation

extension Date {

    func string() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constant.newDateFormat
        return formatter.string(from: self)
    }
}
