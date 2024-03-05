//
//  ArticleListServiceProtocol.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation
import PromiseKit

protocol ArticleListServiceProtocol {
    func fetchArticleList(resource: NetworkResource) -> Promise<[ArticleDataModel]>
}
