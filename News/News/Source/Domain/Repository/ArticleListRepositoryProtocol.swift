//
//  ArticleListRepository.swift
//  News
//
//  Created by Avnish Kumar on 04/02/24.
//

import PromiseKit

protocol ArticleListRepositoryProtocol {
    func fetchArticleList(resource: NetworkResource?) -> Promise<[ArticleDomainModel]>
}
