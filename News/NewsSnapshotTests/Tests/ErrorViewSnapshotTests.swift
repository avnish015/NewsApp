//
//  ErrorViewSnapshotTests.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 15/01/24.
//

import XCTest
import SnapshotTesting
@testable import News

final class ErrorViewSnapshotTests: XCTestCase {

    var errorView: ErrorView!

    override func setUp() {
        errorView = ErrorView(description: "Network Error")
    }

    func testErrorView() {
        let bounds = UIScreen.main.bounds
        assertSnapshot(of: errorView.frame(width: bounds.width, height: bounds.width), as: .image)
    }
}
