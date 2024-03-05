//
//  Article.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

struct Article: Identifiable {
    let id: String
    let title: String
    let author: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String

    var imageURL: URL? {
        guard let urlToImage else { return nil }
        return URL(string: urlToImage)
    }

    var accessabilityHint: String {
        let formattedDate = publishedAt.formattedDate()?.string()
        return """
        Name \(title), \(author != nil ? "Author \(author ?? .empty)" : .empty) \
        \(formattedDate != nil ? "Published At \(formattedDate ?? .empty)" : .empty)
        """
    }

    init(id: String,
         author: String?,
         title: String,
         description: String?,
         url: String, urlToImage: String?,
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

extension Article {
    static let sampleArticle: Article = Article(id: UUID().uuidString,
                                                author: "David Henderson",
                                                title: "An EV Canary in the Coal Mine?",
                                                description: "I think California is the canary in the coal mine",
                                                url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                                                urlToImage: "https://www.adorn-india.com/files/02212312043435.png",
                                                publishedAt: "2023-12-04T18:46:48Z")
}
