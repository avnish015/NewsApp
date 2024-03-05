//
//  AppLaunchArgument.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation

enum AppLaunchArgument: String {
    case newsListSuccess
    case newsListFailure

    var present: Bool {
        CommandLine.arguments.contains(rawValue)
    }
}

extension AppLaunchArgument {
    static var isTesting: Bool {
        CommandLine.arguments.contains("isTesting")
    }
}
