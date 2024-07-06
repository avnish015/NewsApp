//
//  AppConfiguration.swift
//  News
//
//  Created by Avnish Kumar on 05/07/24.
//

import Foundation
import Kingfisher

protocol AppConfigurationProtocol {
    func urlSession() -> URLSession
}

class AppConfiguration: AppConfigurationProtocol {

    private let imageAuthenticationHandler = ImageAuthenticationHandler()

    init() {
        KingfisherManager.shared.downloader.authenticationChallengeResponder = imageAuthenticationHandler
    }
    
    func urlSession() -> URLSession {
        let authenticator = URLSessionTrustEvaluator()
        return URLSession(configuration: .default, delegate: authenticator, delegateQueue: nil)
    }
}
