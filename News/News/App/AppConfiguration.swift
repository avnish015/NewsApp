//
//  AppConfiguration.swift
//  News
//
//  Created by Avnish Kumar on 05/07/24.
//

import Foundation
import Kingfisher

protocol AppConfigurationProtocol {
    var imageAuthenticationHandler: ImageAuthenticationHandler { get }
    func urlSession() -> URLSession
}

class AppConfiguration: AppConfigurationProtocol {

    let imageAuthenticationHandler = ImageAuthenticationHandler()

    required init() {
        KingfisherManager.shared.downloader.authenticationChallengeResponder = imageAuthenticationHandler
    }
    
    func urlSession() -> URLSession {
        let authenticator = URLSessionTrustEvaluator()
        return URLSession(configuration: .default, delegate: authenticator, delegateQueue: nil)
    }
}
