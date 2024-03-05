//
//  Endpoint.swift
//  News
//
//  Created by Avnish Kumar on 16/01/24.
//

import Foundation

struct Endpoint {
    let path: String
    let query: [String: String]?
}

extension Endpoint {
    var url: URL? {
        if AppLaunchArgument.isTesting {
            return MockURLList.mockURL(endPoint: self)
        } else {
            return URL.url(path, query: query)
        }
    }
}
