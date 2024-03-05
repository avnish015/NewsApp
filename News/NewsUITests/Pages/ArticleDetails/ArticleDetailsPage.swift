//
//  ArticleDetailsPage.swift
//  NewsUITests
//
//  Created by Avnish Kumar on 08/12/23.
//

import XCTest
@testable import News

final class ArticleDetailsPage {

    private let app = App.app
    let titleText: XCUIElement
    let authorText: XCUIElement
    let dateText: XCUIElement
    let descriptionText: XCUIElement

    init() {
        titleText = app.staticTexts["Dørhåndtag på Teslas hypede Cybertruck vækker forundring"]
        authorText = app.staticTexts["Source: Author1"]
        dateText = app.staticTexts["Published: 05-12-2023"]
        descriptionText = app.staticTexts["Ved Cybertrucks lancering måtte Elon Musk vise forvirrede nye ejere, hvordan man kommer ind i bilen."]
    }

    func shouldSeeArticleDetails() {
        XCTAssert(titleText.exists)
        XCTAssert(authorText.exists)
        XCTAssert(dateText.exists)
        XCTAssert(descriptionText.exists)
    }
}
