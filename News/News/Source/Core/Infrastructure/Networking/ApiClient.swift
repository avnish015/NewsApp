//
//  Networking.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation
import PromiseKit

protocol ApiClient {
    func callApi<T: Decodable>(responseType: T.Type, resource: NetworkResource) -> Promise<T>
}
