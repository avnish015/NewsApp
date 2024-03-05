//
//  ArticleDetailsViewModelMock.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 07/02/24.
//

import Foundation
@testable import News

class ArticleDetailsViewModelMock: ArticleDetailsViewModelProtocol {

    var title: String
    var imageURL: URL?
    var author: String
    var description: String
    var publishedAt: String
    
    init() {
        self.title = "Sample Title"
        self.imageURL = nil
        self.author = "Author"
        self.description = "Description"
        self.publishedAt = "04-12-2023"
    }
}
