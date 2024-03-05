//
//  Bundle+Extension.swift
//  NewsTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import Foundation

final class BundleResource {
    enum ResourceName {
        case newsList
        case newsListNoResponse
    }

    private static var currentBundle: Bundle {
        return Bundle(for: Self.self)
    }

    static func resourceURL(resource: ResourceName) -> URL? {
        switch resource {
        case .newsList: return currentBundle.url(forResource: "NewsList", withExtension: "json")
        case .newsListNoResponse: return currentBundle.url(forResource: "NewsListNoResponse", withExtension: "json")
        }
    }
}
