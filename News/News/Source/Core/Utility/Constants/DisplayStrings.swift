//
//  DisplayString.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation

enum DisplayStrings {
    enum ArticleList {
        static let title = "DisplayStrings.ArticleList.title".localized
        static let errorTitle = "DisplayStrings.ArticleList.errorTitle".localized
        static let retry = "DisplayStrings.ArticleList.retry".localized
        static let identifier = "News List"
        static let errorViewIdentifier = "Error View"
        static let customErrorViewIdentifier = "Custom Error View"

        enum ArticleCell {
            static let imageView = "Image View"
            static func accessabilityIdentifier(title: String) -> String {
                return "News Cell with title \(title)"
            }
        }
    }

    enum ArticleDetails {
        static let source = "DisplayStrings.ArticleDetails.source".localized
        static let publishedAt = "DisplayStrings.ArticleDetails.published".localized
        static let description = "DisplayStrings.ArticleDetails.description".localized
        static let newsDetails = "DisplayStrings.ArticleDetails.newsDetails".localized
        static let title = "DisplayStrings.ArticleDetails.title".localized
        static let back = "DisplayStrings.ArticleDetails.back".localized
        static let defaultImageIdentifier = "Default Image"
        static func imageViewIdentifier(url: URL?) -> String {
            return "Image with URL \(url?.absoluteString ?? "")"
        }
    }

    enum Other {
        static let sampleFormatted = "DisplayStrings.other.sampleFormatted".localized
        static let dependencyNotRegistered = "DisplayStrings.Other.dependencyNotRegistered".localized
        static let unknownSource = "DisplayStrings.other.unknownSource".localized
    }
}
