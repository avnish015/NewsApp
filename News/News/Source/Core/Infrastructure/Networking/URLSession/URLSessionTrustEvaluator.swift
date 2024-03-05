//
//  URLSessionTrustEvaluator.swift
//  News
//
//  Created by Avnish Kumar on 29/01/24.
//

import Foundation
import Kingfisher

class URLSessionTrustEvaluator: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if let serverTrust = challenge.protectionSpace.serverTrust {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        }
    }
}
