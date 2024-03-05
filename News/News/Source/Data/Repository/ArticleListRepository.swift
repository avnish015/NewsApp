//
//  ArticleListRepository.swift
//  News
//
//  Created by Avnish Kumar on 03/01/24.
//

import Foundation
import PromiseKit

final class ArticleListRepository {

    let service: ArticleListServiceProtocol

    init(service: ArticleListServiceProtocol) {
        self.service = service
    }
}

extension ArticleListRepository: ArticleListRepositoryProtocol {

    func fetchArticleList(resource: NetworkResource?) -> Promise<[ArticleDomainModel]> {
        guard let resource = resource else {
            return Promise(error: HTTPError.wrongURL)
        }
        return service
            .fetchArticleList(resource: resource)
            .map {ArticleListMapper().toModel($0)}
    }
}
