//
//  ArticleListMapper.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

struct ArticleListMapper: Mappable {

    typealias Input = [ArticleDataModel]
    typealias Output = [ArticleDomainModel]

    func toModel(_ input: Input) -> Output {
        return input.map { ArticleMapper().toModel($0) }
    }
}
