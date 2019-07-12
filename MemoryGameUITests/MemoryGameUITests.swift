//
//  MemoryGameUITests.swift
//  MemoryGameUITests
//
//  Created by Josip Rezic on 12/07/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import XCTest

class MemoryGameUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testMenuButtonsExistence() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let settingsButton = app.buttons["Settings"]
        let newGameButton = app.buttons["New Game"]
        XCTAssertTrue(settingsButton.exists, "Error: Settings button does not exist.")
        XCTAssertTrue(newGameButton.exists, "Error: New game button does not exist.")
    }

}
