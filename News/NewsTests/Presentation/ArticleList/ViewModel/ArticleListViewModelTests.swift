//
//  ArticleListViewModelTests.swift
//  NewsTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest
import PromiseKit
import Combine
@testable import News

@MainActor
final class ArticleListViewModelTests: XCTestCase {

    private var cancellables = [AnyCancellable]()

    override func setUp() {
    }

    func testSuccessResponse() async {
        let mockRepository = ArticleListDataRepositoryMock(shouldFail: false)
        let usecase = ArticleListUseCase(repository: mockRepository)
        let viewModel = ArticleListViewModel(useCase: usecase)
        viewModel.refreshArticleList(showLoading: true)
        let expectation = XCTestExpectation(description: "Success response")
        viewModel.$articleList
            .dropFirst()
            .sink(receiveValue: { articles in
                expectation.fulfill()
                XCTAssert(articles.count == 1)
                XCTAssert(viewModel.state == .loaded)
            })
            .store(in: &cancellables)
            await fulfillment(of: [expectation], timeout: 3)
    }

    func testFailureResponse() async {
        let mockRepository = ArticleListDataRepositoryMock(shouldFail: true)
        let usecase = ArticleListUseCase(repository: mockRepository)
        let viewModel = ArticleListViewModel(useCase: usecase)
        viewModel.refreshArticleList(showLoading: true)
        let expectation = XCTestExpectation(description: "Failed response")
        viewModel.$articleList
            .dropFirst()
            .sink(receiveValue: { articles in
                expectation.fulfill()
                XCTAssert(.failed("Bad Request") == viewModel.state)
                XCTAssert(articles.count == 0)
            })
            .store(in: &cancellables)
            await fulfillment(of: [expectation], timeout: 1)
    }
}
