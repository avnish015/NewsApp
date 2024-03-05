//
//  ArticleListUITests.swift
//  NewsUITests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest

final class ArticleListUITests: XCTestCase {

    let articleListPage = ArticleListPage()
    let articleCellViewPage = ArticleCellViewPage()

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testArticleListView() throws {
        App.launch(argument: AppLaunchArgument.newsListSuccess.rawValue)
        _ = waitForElementToAppear(articleListPage.firstCell)
        XCTAssert(articleListPage.cells.count == 3)
        articleCellViewPage.shouldSeeDetails()
        articleListPage.selectFirstCell()
        articleListPage.shouldSeeArticleDetailsPage()
    }

    func testArticleListViewForFailureResponse() throws {
        App.removeArgument(argument: AppLaunchArgument.newsListSuccess.rawValue)
        App.launch(argument: AppLaunchArgument.newsListFailure.rawValue)
        _ = waitForElementToAppear(articleListPage.errorViewTitle)
        XCTAssertFalse(articleListPage.tableView.exists)
        articleListPage.shouldSeeErrorView()
    }

    func waitForElementToAppear(_ element: XCUIElement, 
                                maxDuration: Double = 5,
                                failIfNotAppeared: Bool = true) -> Bool {

        if element.exists {
            return true
        }
        let predicate = NSPredicate { _, _ in
            element.exists && element.isHittable
        }
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter().wait(for: [ expectation ], timeout: maxDuration)
        let isExists = result == .completed

        if !isExists && failIfNotAppeared {
            XCTFail("Timed out waiting for element: \(element) to appear.")
        }
        return isExists
    }
}
