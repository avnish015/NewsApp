//
//  ArticleListViewModel.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation
import PromiseKit

internal enum ArticleListState: Equatable {
    case loading
    case loaded
    case failed(String)
}

protocol ArticleListViewModelProtocol: ObservableObject {
    var articleList: [Article] { get }
    var state: ArticleListState { get }
    var isEmpty: Bool { get }
    func refreshArticleList(showLoading: Bool)
    func createArticleCellViewModel(for article: Article) -> ArticleCellViewModel
}

final class ArticleListViewModel: ArticleListViewModelProtocol {

    private let useCase: ArticleListUseCaseProtocol

    @Published var articleList: [Article] = []
    @Published var state: ArticleListState = .loading

    var isEmpty: Bool {
        return articleList.isEmpty
    }

    init(useCase: ArticleListUseCaseProtocol) {
        self.useCase = useCase
    }

    func refreshArticleList(showLoading: Bool) {
        if showLoading {
            state = .loading
        }
        useCase.fetchAllArticles()
            .map({PresentationArticleListMapper().toModel($0)})
            .done(on: .main) { articles in
                self.state = .loaded
                self.articleList = articles
            }
            .catch { error in
                self.state = .failed(self.errorMessage(error: error))
                self.articleList = []
            }
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
