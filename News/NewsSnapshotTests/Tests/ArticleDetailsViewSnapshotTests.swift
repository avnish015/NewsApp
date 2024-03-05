//
//  ArticleDetailsViewSnapshotTests.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import SnapshotTesting
import XCTest
@testable import News

final class ArticleDetailsViewSnapshotTests: XCTestCase {

    private var articleDetailsView: ArticleDetailsView!

    override func setUp() {

        let viewModel = ArticleDetailsViewModelMock()
        articleDetailsView = ArticleDetailsView(viewModel: viewModel)
    }

    func testArticleDetailsView() {

        assertSnapshot(of: articleDetailsView.frame(width: UIScreen.main.bounds.width,
                                                    height: UIScreen.main.bounds.height),
                       as: .image)
    }
}
