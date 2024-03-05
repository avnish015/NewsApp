//
//  URL+Extension.swift
//  News
//
//  Created by Avnish Kumar on 16/01/24.
//

import Foundation

extension URL {
    static func url(_ path: String, query: [String: String]?) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/\(path)/"
        if let query {
            var queryItems: [URLQueryItem] = []
            for (key, value) in query {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
            components.queryItems = queryItems
        }
        components.queryItems?.append(URLQueryItem(name: "apiKey", value: Constant.apiKey))
        return components.url
    }
}
