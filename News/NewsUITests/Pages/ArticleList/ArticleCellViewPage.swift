//
//  ArticleCellViewPage.swift
//  NewsTests
//
//  Created by Avnish Kumar on 08/12/23.
//

import XCTest
@testable import News

final class ArticleCellViewPage {

    private let app = App.app

    let cell: XCUIElement
    let iconView: XCUIElement
    let titleText: XCUIElement
    let authorText: XCUIElement
    let dateText: XCUIElement

    init() {
        cell = app.collectionViews["News List"].cells.firstMatch
        iconView = cell.images.firstMatch
        titleText = cell.staticTexts["Dørhåndtag på Teslas hypede Cybertruck vækker forundring"]
        authorText = cell.staticTexts["Author1"]
        dateText = cell.staticTexts["05-12-2023"]
    }

    func shouldSeeDetails() {
        XCTAssert(cell.exists)
        XCTAssert(iconView.exists)
        XCTAssert(titleText.exists)
        XCTAssert(authorText.exists)
        XCTAssert(dateText.exists)
    }
}
