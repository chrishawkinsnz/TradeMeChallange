//
//  ListingsViewUITest.swift
//  TradeMeChallangeUITests
//
//  Created by Inti Albuquerque on 28/10/22.
//

import XCTest

final class ListingsViewUITest: XCTestCase {
    let app = XCUIApplication()
    func testListingsView() {
        app.launch()
        while !app.buttons["item0"].exists {
            sleep(1)
        }
        app.buttons["item0"].tap()
        XCTAssertTrue(app.staticTexts["Tapped on"].exists)
        app.buttons["OK"].tap()
        app.buttons["cart"].tap()
        XCTAssertTrue(app.staticTexts["You tapped on the cart button"].exists)
        app.buttons["OK"].tap()
        app.buttons["search"].tap()
        XCTAssertTrue(app.staticTexts["You tapped on the Search button"].exists)
        app.buttons["OK"].tap()
        app.buttons["Notifications"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Notifications"].exists)
        app.buttons["Watchlist"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Watchlist"].exists)
        app.buttons["My Trade Me"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["My Trade Me"].exists)
        app.buttons["Discover"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Browse"].exists)

    }
}
