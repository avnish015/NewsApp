//
//  ArticleListViewSnapshotTests.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest
import SnapshotTesting
@testable import News
import SwiftUI

final class ArticleListViewSnapshotTests: XCTestCase {

    private var view: ArticleListView<ArticleListViewModelMock>!

    override func setUp() {
        let viewModel = ArticleListViewModelMock()
        view = ArticleListView(viewModel: viewModel)
        view!.viewModel.refreshArticleList(showLoading: true)
    }

    func testArticleListView() throws {
        let articleListView = view.environmentObject(AppDIContainer.preview)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height)
        assertSnapshot(of: articleListView, as: .image)
    }
}
