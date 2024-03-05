//
//  ArticleCellSnapshotTests.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import News

final class ArticleCellSnapshotTests: XCTestCase {

    private var cellView: ArticleCellView!

    override func setUp() {
        let viewModel = ArticleCellViewModelMock()
        cellView = ArticleCellView(viewModel: viewModel)
    }

    func testArticleCellView() {
        assertSnapshot(of: cellView.frame(width: UIScreen.main.bounds.width), as: .image)
    }
}
