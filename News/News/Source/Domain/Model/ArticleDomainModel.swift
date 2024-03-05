//
//  ArticleDomainModel.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation

struct ArticleDomainModel: Identifiable {
    let id: String
    let title: String
    let author: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String

    init(id: String,
         author: String?,
         title: String,
         description: String?,
         url: String,
         urlToImage: String?,
         publishedAt: String) {
        self.id = id
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
}
