//
//  ArticleListDataManagerMock.swift
//  NewsTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import Foundation
import PromiseKit
@testable import News

final class ArticleListDataRepositoryMock {

    private let shouldFail: Bool
    private let error: Error?

    init(shouldFail: Bool, error: Error? = nil) {
        self.shouldFail = shouldFail
        self.error = error
    }
}

extension ArticleListDataRepositoryMock: ArticleListRepositoryProtocol {
    
    func fetchArticleList(resource: NetworkResource?) -> PromiseKit.Promise<[ArticleDomainModel]> {
        return Promise<[ArticleDomainModel]> { seal in
            if shouldFail {
                seal.reject(HTTPError.badRequest)
            } else {

                seal.fulfill([ArticleDomainModel(id: UUID().uuidString,
                                                 author: "Author1",
                                                 title: "Dørhåndtag på Teslas hypede Cybertruck vækker forundring",
                                                 description: "Ved Cybertrucks lancering måtte Elon Musk vise forvirrede nye ejere, hvordan man kommer ind i bilen.",
                                                 url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                                                 urlToImage: "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg",
                                                 publishedAt: "2023-12-05T05:30:16Z")])
            }
        }
    }
}
