//
//  ArticleResponse.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation

final class ArticleResource: NetworkResource {

    let endPoint: Endpoint
    let method: HTTPMethod
    let body: Data?
    let queryParameters: [String: Any]?

    init(endPoint: Endpoint, method: HTTPMethod = .GET, body: Data? = nil, queryParameters: [String: Any] = [:]) {
        self.endPoint = endPoint
        self.method = method
        self.body = body
        self.queryParameters = queryParameters
    }

    func response<T: Decodable>(type: T.Type, data: Data?, response: URLResponse?) -> Swift.Result<T, HTTPError> {
        if let response = response as? HTTPURLResponse, let data = data {
            if response.statusCode <= 300 {
                let decoder = JSONDecoder()
                do {
                    let responseObject = try decoder.decode(T.self, from: data)
                    return .success(responseObject)
                } catch {
                    return .failure(.decodingError)
                }
            } else if response.statusCode >= 300 && response.statusCode < 500 {
                return .failure(.badRequest)
            } else {
                return .failure(.noResponse)
            }
        } else {
            if AppLaunchArgument.isTesting, let data = data {
                do {
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode(T.self, from: data)
                    return .success(responseObject)
                } catch {
                    return .failure(.noResponse)
                }            }
            return .failure(.noResponse)
        }
    }
}
