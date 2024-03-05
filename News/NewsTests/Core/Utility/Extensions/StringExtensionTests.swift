//
//  StringExtensionTests.swift
//  NewsTests
//
//  Created by Avnish Kumar on 05/01/24.
//

import XCTest
@testable import News

final class StringExtensionTests: XCTestCase {

    func testFormattedDate() {
        let format = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: "2023-12-05T05:30:16Z")
        XCTAssert("2023-12-05T05:30:16Z".formattedDate() == date)
    }

    func testFormattedDateWithWrongForat() {
        XCTAssertNil("2023-12-05".formattedDate())
    }

    func testLocalizedString() {
        XCTAssert("DisplayStrings.ArticleList.errorTitle".localized == "Unable to load data")
    }

    func testLocalizedStringWithFormat() {
        XCTAssert("DisplayStrings.other.sampleFormatted".localized(arg: 12) == "Value is 12")
    }

    func testEmptyString() {
        XCTAssert(String.empty == "")
    }
}
