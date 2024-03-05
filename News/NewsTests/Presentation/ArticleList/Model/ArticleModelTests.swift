//
//  ArticleModelTests.swift
//  NewsTests
//
//  Created by Avnish Kumar on 17/01/24.
//

import XCTest
@testable import News

final class ArticleModelTests: XCTestCase {

    private var article: Article!

    override func setUp() {

        article = Article(id: "1",
                          author: "David Henderson",
                          title: "An EV Canary in the Coal Mine?",
                          description: "I’ve written before about why I think California is the canary in the coal mine",
                          url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                          urlToImage: "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg",
                          publishedAt: "2023-12-04T18:46:48Z")
    }

    func testAccessabilityHint() throws {
        XCTAssert(article.id == "1" )
        XCTAssert(article.author == "David Henderson" )
        XCTAssert(article.title == "An EV Canary in the Coal Mine?" )
        XCTAssert(article.description == "I’ve written before about why I think California is the canary in the coal mine" )
        XCTAssert(article.url == "https://www.econlib.org/an-ev-canary-in-the-coal-mine/" )
        XCTAssert(article.urlToImage == "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg" )
        XCTAssert(article.publishedAt == "2023-12-04T18:46:48Z" )
        XCTAssert(article.accessabilityHint == "Name An EV Canary in the Coal Mine?, Author David Henderson Published At 04-12-2023")
        XCTAssert(article.imageURL == URL(string: "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg"))
    }
}
