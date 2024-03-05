//
//  ArticleCellViewModel.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation

protocol ArticleCellViewModelProtocol {
    var title: String { get }
    var urlToImage: URL? { get }
    var author: String { get }
    var publishedAt: String { get }
}

final class ArticleCellViewModel: ArticleCellViewModelProtocol {

    let title: String
    let urlToImage: URL?
    let author: String
    let publishedAt: String

    init(article: Article) {
        self.title = article.title
        self.urlToImage = article.imageURL
        self.author = article.author ?? DisplayStrings.Other.unknownSource
        self.publishedAt = article.publishedAt.formattedDate()?.string() ?? .empty
    }
}
