//
//  String+extension.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation

extension String {

    static var empty: String {
        return ""
    }

    func formattedDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = Constant.oldDateFormat
        return formatter.date(from: self)
    }

    func localized(arg: CVarArg...) -> String {
        let localizedString = NSLocalizedString(self, comment: self)
       return String(format: localizedString, arg)
    }

    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
}
