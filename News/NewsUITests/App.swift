//
//  App.swift
//  NewsUITests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest

class App {
    static var app = {
        let app = XCUIApplication()
        app.launchArguments.append("isTesting")
        return app
    }()

    static func launch(argument: String) {
        app.launchArguments.append(argument)
        app.launch()
    }

    static func removeArgument(argument: String) {
        app.launchArguments.removeAll(where: {$0 == argument})
    }
}
