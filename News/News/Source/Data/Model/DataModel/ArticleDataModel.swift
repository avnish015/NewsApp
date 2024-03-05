//
//  ArticleDataModel.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

    struct ArticleDataModel: Identifiable, Codable {
        let id: String
        let title: String
        let author: String?
        let description: String?
        let url: String
        let urlToImage: String?
        let publishedAt: String

        enum CodingKeys: CodingKey {
            case id
            case author
            case title
            case description
            case url
            case urlToImage
            case publishedAt
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
            self.author = try container.decodeIfPresent(String.self, forKey: .author)
            self.title = try container.decode(String.self, forKey: .title)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.url = try container.decode(String.self, forKey: .url)
            self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
            self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
        }

        init(id: String,
             name: String?,
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

extension ArticleDataModel {

    static let sampleArticle: Article = Article(id: UUID().uuidString,
                                                author: "David Henderson",
                                                title: "An EV Canary in the Coal Mine?",
                                                description: "I’ve written before about why I think California",
                                                url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                                                urlToImage: "https://www.adorn-india.com/files/02212312043435.png",
                                                publishedAt: "2023-12-04T18:46:48Z")
}
