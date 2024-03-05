//
//  ArticleCellViewModelMock.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 07/02/24.
//

import Foundation
@testable import News

struct ArticleCellViewModelMock: ArticleCellViewModelProtocol {
    
    var title: String
    var urlToImage: URL?
    var author: String
    var publishedAt: String
    
    init() {
        self.title = "Sample Title"
        self.urlToImage = nil
        self.author = "Author"
        self.publishedAt = "04-12-2023"
    }
}
