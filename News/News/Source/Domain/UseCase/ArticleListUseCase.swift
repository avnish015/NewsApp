//
//  ArticleListUseCase.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation
import PromiseKit

protocol ArticleListUseCaseProtocol {
    func fetchAllArticles() -> Promise<[ArticleDomainModel]>
}

final class ArticleListUseCase {

   private let repository: ArticleListRepositoryProtocol

    init(repository: ArticleListRepositoryProtocol) {
        self.repository = repository
    }
}

extension ArticleListUseCase: ArticleListUseCaseProtocol {

    func fetchAllArticles() -> Promise<[ArticleDomainModel]> {
        let resource = ArticleResource(endPoint: .topHeadlines)
        return repository.fetchArticleList(resource: resource)
    }
}
