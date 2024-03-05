//
//  EndPoint+Extension.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

extension Endpoint {

    static var topHeadlines: Endpoint {
        let endPoint = Endpoint(path: "/top-headlines", query: ["country": "in"])
        return endPoint
    }
}
