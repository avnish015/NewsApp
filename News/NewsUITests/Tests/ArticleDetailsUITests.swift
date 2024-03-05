//
//  ArticleDetailsUITests.swift
//  NewsUITests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest

final class ArticleDetailsUITests: XCTestCase {

    private let articleListViewPage = ArticleListPage()
    private let articleDetailsPage = ArticleDetailsPage()

    override func setUpWithError() throws {
        App.launch(argument: "isTestSuccess")
        continueAfterFailure = false
    }

    func testArticleDetail() throws {
        App.removeArgument(argument: AppLaunchArgument.newsListSuccess.rawValue)
        App.launch(argument: AppLaunchArgument.newsListSuccess.rawValue)
        articleListViewPage.selectFirstCell()
        articleListViewPage.shouldSeeArticleDetailsPage()
        articleDetailsPage.shouldSeeArticleDetails()
    }
}
