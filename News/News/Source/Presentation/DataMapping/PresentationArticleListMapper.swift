//
//  PresentationArticleListMapper.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

struct PresentationArticleListMapper: Mappable {

    typealias Input = [ArticleDomainModel]
    typealias Output = [Article]
    func toModel(_ input: Input) -> Output {
        input.map {PresentationArticleMapper().toModel($0) }
    }
}

struct PresentationArticleMapper: Mappable {

    typealias Input = ArticleDomainModel
    typealias Output = Article

    func toModel(_ input: Input) -> Output {

        Article(id: input.id,
                author: input.author,
                title: input.title,
                description: input.description,
                url: input.url,
                urlToImage: input.urlToImage,
                publishedAt: input.publishedAt)
    }
}
