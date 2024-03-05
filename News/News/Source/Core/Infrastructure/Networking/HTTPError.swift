//
//  HTTPError.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

enum HTTPError: Error {
    case decodingError
    case noResponse
    case wrongURL
    case badRequest
    case other

    var description: String {
        switch self {
        case .decodingError:
            return "Invalid Response"
        case .noResponse:
            return "No Response"
        case .wrongURL:
            return "Wrong url"
        case .badRequest:
            return "Bad Request"
        case .other:
            return "Some Error"
        }
    }
}
