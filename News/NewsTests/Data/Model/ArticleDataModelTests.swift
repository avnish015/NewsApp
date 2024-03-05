//
//  ArticleDataModelTests.swift
//  NewsTests
//
//  Created by Avnish Kumar on 17/01/24.
//

import XCTest
@testable import News

final class ArticleDataModelTests: XCTestCase {

    let article = ArticleDataModel(
                          id: "1",
                          name: "David",
                          author: "David Henderson",
                          title: "An EV Canary in the Coal Mine?",
                          description: "I’ve written before about why I think California is the canary in the coal mine",
                          url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                          urlToImage: "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg",
                          publishedAt: "2023-12-04T18:46:48Z")

    func testArticleDataModel() throws {
        XCTAssert(article.id == "1" )
        XCTAssert(article.author == "David Henderson" )
        XCTAssert(article.title == "An EV Canary in the Coal Mine?" )
        XCTAssert(article.description == "I’ve written before about why I think California is the canary in the coal mine" )
        XCTAssert(article.url == "https://www.econlib.org/an-ev-canary-in-the-coal-mine/" )
        XCTAssert(article.urlToImage == "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg" )
        XCTAssert(article.publishedAt == "2023-12-04T18:46:48Z" )
    }
}
