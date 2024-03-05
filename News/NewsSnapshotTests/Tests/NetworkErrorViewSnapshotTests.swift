//
//  NetworkErrorViewSnapshotTests.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 15/01/24.
//

import XCTest
import SnapshotTesting
@testable import News

final class NetworkErrorViewSnapshotTests: XCTestCase {

    var errorView: NetworkErrorView!

    override func setUp() {
        errorView = NetworkErrorView(description: "Network Error")
    }

    func testNetworkErrorView() {
        let bounds = UIScreen.main.bounds
        assertSnapshot(of: errorView.frame(width: bounds.width, height: bounds.width), as: .image)
    }
}
