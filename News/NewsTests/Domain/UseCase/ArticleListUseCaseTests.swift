//
//  ArticleListUseCaseTests.swift
//  NewsTests
//
//  Created by Avnish Kumar on 17/01/24.
//

import XCTest
@testable import News

final class ArticleListUseCaseTests: XCTestCase {

    func testArticleListUseCaseSuccess() throws {
        let expectation = expectation(description: "ArticleListSuccess")
        let repostory = ArticleListDataRepositoryMock(shouldFail: false)
        let useCase = ArticleListUseCase(repository: repostory)
        var articleList: [ArticleDomainModel] = []
        var theError: Error?

        useCase.fetchAllArticles()
            .done { list in
                articleList = list
                expectation.fulfill()
            }.catch { error in
                theError = error
                expectation.fulfill()
            }

        wait(for: [expectation], timeout: 10)
        XCTAssertNil(theError)
        XCTAssertFalse(articleList.isEmpty)
        let article = try XCTUnwrap(articleList.first)
        XCTAssertEqual(article.description, "Ved Cybertrucks lancering måtte Elon Musk vise forvirrede nye ejere, hvordan man kommer ind i bilen.")
        XCTAssertEqual(article.title, "Dørhåndtag på Teslas hypede Cybertruck vækker forundring")
        XCTAssertEqual(article.description,  "Ved Cybertrucks lancering måtte Elon Musk vise forvirrede nye ejere, hvordan man kommer ind i bilen.")
        XCTAssertEqual(article.urlToImage,  "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg")
        XCTAssertEqual(article.url,  "https://www.econlib.org/an-ev-canary-in-the-coal-mine/")
        XCTAssertEqual(article.publishedAt, "2023-12-05T05:30:16Z")
    }

    func testArticleListUseCaseFailure() throws {
        let expectation = expectation(description: "ArticleListFailure")
        let repostory = ArticleListDataRepositoryMock(shouldFail: true)
        let useCase = ArticleListUseCase(repository: repostory)
        var theError: Error?

        useCase.fetchAllArticles()
            .done { _ in
                expectation.fulfill()
            }.catch { error in
                theError = error
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(theError)
    }
}
