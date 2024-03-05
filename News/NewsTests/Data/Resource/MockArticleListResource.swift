//
//  MockArticleListResource.swift
//  NewsTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import Foundation
@testable import News

final class MockArticleListResource: NetworkResource, MockResource {

    let endPoint: Endpoint = Endpoint.topHeadlines
    let method: HTTPMethod = .GET
    let body: Data? = nil
    let queryParameters: [String: Any]? = nil
    let resourceName: BundleResource.ResourceName

    init(resourceName: BundleResource.ResourceName) {
        self.resourceName = resourceName
    }

    func response<T>(type: T.Type, data: Data?, response: URLResponse?) -> Result<T, HTTPError> where T : Decodable {
        if let data = data {
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(T.self, from: data)
                return .success(response)
            } catch {
                return .failure(.decodingError)
            }
        }
        return .failure(.other)
    }
}
