//
//  MockApiClient.swift
//  NewsTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import Foundation
import PromiseKit
@testable import News

final class MockApiClient: ApiClient {
    func callApi<T: Decodable>(responseType: T.Type, resource: NetworkResource) -> Promise<T> {
        return Promise<T> { seal in

            switch resource.response(type: T.self,
                                     data: try? Data(contentsOf: resourceURL(for: resource)!),
                                     response: nil) {
            case .success(let response):
                return seal.fulfill(response)
            case .failure(let error):
                return seal.reject(error)
            }
        }
    }

    private func resourceURL(for resource: NetworkResource) -> URL? {
        guard let resource = resource as? MockResource else {
            return nil
        }
        return BundleResource.resourceURL(resource: resource.resourceName)
    }
}
