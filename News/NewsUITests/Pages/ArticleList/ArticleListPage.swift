//
//  ArticleListPage.swift
//  NewsUITests
//
//  Created by Avnish Kumar on 08/12/23.
//

import XCTest
@testable import News

final class ArticleListPage {

    let app: XCUIApplication
    let tableView: XCUIElement
    let cells: XCUIElementQuery
    let firstCell: XCUIElement
    let articleDetailsNavigationBar: XCUIElement
    let errorViewTitle: XCUIElement

    init() {
        app = App.app
        tableView = app.collectionViews["News List"]
        self.cells = tableView.cells
        self.firstCell = app.collectionViews["News List"]
                            .buttons["News Cell with title Dørhåndtag på Teslas hypede Cybertruck vækker forundring"]
        self.articleDetailsNavigationBar = app.navigationBars["News Details"]
        self.errorViewTitle = app.staticTexts["Error View"]
    }

    func selectFirstCell() {
        cells.firstMatch.tap()
    }

    func shouldSeeArticleDetailsPage() {
        XCTAssertTrue(articleDetailsNavigationBar.exists)
    }

    func shouldSeeErrorView() {
        XCTAssertTrue(app.staticTexts["No Response"].exists)
        XCTAssertTrue(app.images["Warning"].exists)
        XCTAssertTrue(app.buttons["Retry"].exists)
    }
}
