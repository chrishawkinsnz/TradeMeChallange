//
//  ListingsUnitTests.swift
//  TradeMeChallangeTests
//
//  Created by Inti Albuquerque on 28/10/22.
//

import XCTest
@testable import TradeMeChallange

final class ListingsUnitTests: XCTestCase {

    func testFetchingListingsSuccess() async {
        let fetcher = MockDataFetcher()
        let viewModel = ListingsViewModel(dataFetcher: fetcher)
        XCTAssertTrue(viewModel.showLoading)
        fetcher.expectation = self.expectation(description: "waiting for listings")
        await viewModel.fetchListings()
        await waitForExpectations(timeout: 10)
        XCTAssertEqual(viewModel.listings[0].id, 1)
        XCTAssertFalse(viewModel.showLoading)
    }
    
    func testFetchingListingsFail() async {
        let fetcher = MockDataFetcher()
        fetcher.shouldShowError = true
        let viewModel = ListingsViewModel(dataFetcher: fetcher)
        XCTAssertTrue(viewModel.showLoading)
        fetcher.expectation = self.expectation(description: "waiting for listings")
        await viewModel.fetchListings()
        await waitForExpectations(timeout: 10)
        XCTAssertTrue(viewModel.listings.isEmpty)
        XCTAssertTrue(viewModel.shouldShowAlert)
        XCTAssertEqual(viewModel.alertContent?.createAlertContent().title, "test error title")
        XCTAssertFalse(viewModel.showLoading)
    }
    
    func testShowAlert() async {
        let fetcher = MockDataFetcher()
        let viewModel = ListingsViewModel(dataFetcher: fetcher)
        viewModel.showAlert(type: .cart)
        XCTAssertTrue(viewModel.shouldShowAlert)
        XCTAssertEqual(viewModel.alertContent?.createAlertContent().title, "CartTitle")
        viewModel.showAlert(type: .search)
        XCTAssertTrue(viewModel.shouldShowAlert)
        XCTAssertEqual(viewModel.alertContent?.createAlertContent().title, "SearchTitle")
        viewModel.showAlert(type: .error)
        XCTAssertTrue(viewModel.shouldShowAlert)
        XCTAssertEqual(viewModel.alertContent?.createAlertContent().title, "ErrorTitle")

    }
}
