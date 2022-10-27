//
//  ListingsUnitTests.swift
//  TradeMeChallangeTests
//
//  Created by Inti Albuquerque on 28/10/22.
//

import XCTest
@testable import TradeMeChallange

final class ListingsUnitTests: XCTestCase {

    func testFetchingListings() async {
        let fetcher = MockDataFetcher()
        let viewModel = ListingsViewModel(dataFetcher: fetcher)
        fetcher.expectation = self.expectation(description: "waiting for listings")
        await viewModel.fetchListings()
        await waitForExpectations(timeout: 10)
        XCTAssertEqual(viewModel.list[0].id, 1)
    }
}
