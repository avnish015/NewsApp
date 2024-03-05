//
//  DosplayStringsTests.swift
//  NewsTests
//
//  Created by Avnish Kumar on 15/01/24.
//

import XCTest
@testable import News

final class DisplayStringsTests: XCTestCase {

    var url: URL?

    override func setUp() {
        url = URL(string: "https://sample.com")
    }

    func testExample() throws {
        XCTAssert(DisplayStrings.ArticleDetails.imageViewIdentifier(url: url) == "Image with URL https://sample.com")
    }
}
