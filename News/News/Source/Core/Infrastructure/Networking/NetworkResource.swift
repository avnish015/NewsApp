//
//  NetworkResource.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

protocol NetworkResource {
    var endPoint: Endpoint { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var timeoutInterval: Double { get }
    var queryParameters: [String: Any]? { get }
    var contentType: String { get }
    func response<T: Decodable>(type: T.Type, data: Data?, response: URLResponse?) -> Swift.Result<T, HTTPError>
}

extension NetworkResource {
    var contentType: String {
        return "application/json"
    }

    var timeoutInterval: Double {
        return 10.0
    }
}
