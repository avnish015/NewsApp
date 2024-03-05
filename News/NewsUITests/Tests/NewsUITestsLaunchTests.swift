//
//  NewsUITestsLaunchTests.swift
//  NewsUITests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest

final class NewsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        App.launch(argument: "isTestSuccess")

        let attachment = XCTAttachment(screenshot: App.app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
