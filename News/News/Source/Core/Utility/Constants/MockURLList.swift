//
//  MockURLList.swift
//  News
//
//  Created by Avnish Kumar on 16/01/24.
//

import Foundation

class MockURLList {
    static func mockURL(endPoint: Endpoint) -> URL? {
        switch endPoint.path {
        case "/top-headlines":
            if AppLaunchArgument.newsListSuccess.present {
                if let url = Bundle(for: Self.self).url(forResource: "NewsList", withExtension: "json") {
                    return url
                } else {
                    return nil
                }
            } else if AppLaunchArgument.newsListFailure.present {
                if let url = Bundle(for: Self.self).url(forResource: "NewsListNoResponse", withExtension: "json") {
                    return url
                } else {
                    return nil
                }
            } else {
                return nil
            }
        default: return nil
        }
    }
}
