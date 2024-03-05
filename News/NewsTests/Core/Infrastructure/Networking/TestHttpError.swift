//
//  TestHttpError.swift
//  NewsTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest
@testable import News

final class TestHttpError: XCTestCase {

    func testErrors() throws {
        let decoding = HTTPError.decodingError
        XCTAssert(decoding.description == "Invalid Response")

        let badRequest = HTTPError.badRequest
        XCTAssert(badRequest.description == "Bad Request")

        let noResponse = HTTPError.noResponse
        XCTAssert(noResponse.description == "No Response")

        let wrongURL = HTTPError.wrongURL
        XCTAssert(wrongURL.description == "Wrong url")
    }
}
