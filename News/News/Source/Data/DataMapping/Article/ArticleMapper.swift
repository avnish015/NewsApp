//
//  ArticleMapper.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

struct ArticleMapper: Mappable {

    typealias Input = ArticleDataModel
    typealias Output = ArticleDomainModel

    func toModel(_ input: Input) -> Output {
        ArticleDomainModel(id: input.id,
                           author: input.author,
                           title: input.title,
                           description: input.description,
                           url: input.url,
                           urlToImage: input.urlToImage,
                           publishedAt: input.publishedAt)
    }
}
