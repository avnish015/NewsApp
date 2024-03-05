//
//  ArticleListViewModelMock.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 07/02/24.
//

import Foundation
@testable import News

final class ArticleListViewModelMock: ArticleListViewModelProtocol {

    @Published var articleList: [Article] = []
    @Published var state: ArticleListState = .loading

    var isEmpty: Bool {
        return articleList.isEmpty
    }

    func refreshArticleList(showLoading: Bool) {
        self.state = .loaded
        self.articleList = [
            Article(id: UUID().uuidString,
                                  author: "Author 1",
                                  title: "Sample title 1",
                                  description: "Sample description 1",
                                  url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                                  urlToImage: "",
                                  publishedAt: "2023-12-04T5:46:48Z"),
            Article(id: UUID().uuidString,
                                  author: "Author 2",
                                  title: "Sample title 2",
                                  description: "Sample description 2",
                                  url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                                  urlToImage: "",
                                  publishedAt: "2023-12-04T12:46:48Z"),
            Article(id: UUID().uuidString,
                                  author: "Author 3",
                                  title: "Sample title 3",
                                  description: "Sample description 3",
                                  url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                                  urlToImage: "",
                                  publishedAt: "2023-12-04T18:46:48Z"),
        ]
    }

    func createArticleCellViewModel(for article: Article) -> ArticleCellViewModel {
        ArticleCellViewModel(article: article)
    }

    private func errorMessage(error: Error) -> String {
        if let error = error as? HTTPError {
            return error.description
        } else {
            return error.localizedDescription
        }
    }
}
