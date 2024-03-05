//
//  ImageAuthenticationHandler.swift
//  News
//
//  Created by Avnish Kumar on 05/02/24.
//

import Foundation
import Kingfisher

class ImageAuthenticationHandler: NSObject, AuthenticationChallengeResponsible {
    
    func downloader(_ downloader: ImageDownloader, didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if let serverTrust = challenge.protectionSpace.serverTrust {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        }
    }
}
