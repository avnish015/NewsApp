//
//  ArticleListService.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation
import PromiseKit

final class ArticleListService {

   private let apiClient: ApiClient

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
}

extension ArticleListService: ArticleListServiceProtocol {

    func fetchArticleList(resource: NetworkResource) -> Promise<[ArticleDataModel]> {
        return apiClient.callApi(responseType: ArticleResponse.self, resource: resource)
            .map({$0.articles})
    }
}
