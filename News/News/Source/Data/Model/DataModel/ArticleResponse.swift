//
//  ArticleResponse.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

struct ArticleResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleDataModel]
}
