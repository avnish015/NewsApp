//
//  ArticleViewModelTest.swift
//  NewsTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest
@testable import News

final class ArticleCellViewModelTests: XCTestCase {

    private var viewModel: ArticleCellViewModel?
    private var viewModelWithPartialData: ArticleCellViewModel?

    override func setUp() {
        viewModel = ArticleCellViewModel(article: Article(id: UUID().uuidString,
                                                          author: "David Henderson",
                                                          title: "An EV Canary in the Coal Mine?",
                                                          description: "I’ve written before about why I think California is the canary in the coal mine",
                                                          url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                                                          urlToImage: "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg",
                                                          publishedAt: "2023-12-04T18:46:48Z"))
        viewModelWithPartialData = ArticleCellViewModel(article: Article(id: UUID().uuidString,
                                                                         author: nil,
                                                                         title: "Title",
                                                                         description: nil,
                                                                         url: "https://www.SampleURL.com",
                                                                         urlToImage: nil,
                                                                         publishedAt: "2023-12-04"))
    }

    func testArticleViewModel() throws {
        XCTAssert(viewModel?.title == "An EV Canary in the Coal Mine?")
        XCTAssert(viewModel?.urlToImage == URL(string: "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg"))
        XCTAssert(viewModel?.publishedAt == "04-12-2023")
        XCTAssert(viewModel?.author == "David Henderson")
    }

    func testArticleViewModelWithPartialData() {
        XCTAssert(viewModelWithPartialData?.publishedAt == String.empty)
        XCTAssert(viewModelWithPartialData?.author == "Unknown Source")
        XCTAssert(viewModelWithPartialData?.urlToImage == nil)
    }
}
