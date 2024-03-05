//
//  URLSessionApiClient.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation
import PromiseKit

final class URLSessionApiClient: ApiClient {

    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func callApi<T>(responseType: T.Type, resource: any NetworkResource) -> PromiseKit.Promise<T> where T: Decodable {

        return Promise<T> { seal in
            guard let urlRequest = self.makeRequest(resource: resource) else {
                seal.reject(HTTPError.wrongURL)
                return
            }
            session.dataTask(with: urlRequest) {data, response, error in
                switch resource.response(type: responseType, data: data, response: response) {
                    case .success(let data):
                        return seal.fulfill(data)
                    case .failure(let error):
                        seal.reject(error)
                    }
            }
            .resume()
        }
    }

    private func makeRequest(resource: NetworkResource) -> URLRequest? {
        guard let url = resource.endPoint.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = resource.method.rawValue
        urlRequest.setValue(resource.contentType, forHTTPHeaderField: "Accept")
        urlRequest.setValue(resource.contentType, forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = resource.body
        urlRequest.timeoutInterval = resource.timeoutInterval
        return urlRequest
    }
}
