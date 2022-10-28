//
//  MockDataFetcher.swift
//  TradeMeChallangeTests
//
//  Created by Inti Albuquerque on 28/10/22.
//

import Foundation
import XCTest
@testable import TradeMeChallange

class MockDataFetcher: DataFetcherProtocol {
    var requestTimeOut: Float = 0.0
    var expectation: XCTestExpectation?
    var shouldShowError = false
    
    func request<ResponseType>(_ req: TradeMeChallange.DataFetcherRequest, decoder: TradeMeChallange.DecoderProtocol) async throws -> ResponseType where ResponseType : Decodable {
        expectation?.fulfill()
        expectation = nil
        if shouldShowError {
            throw DataFetcherError(title: "test error title", message: "test error message")
        } else {
            return ListingsResponse(list: [
                ListingsResponse.ListItem(
                    title: "test item",
                    region: "test region",
                    pictureHref: nil,
                    priceDisplay: "$10",
                    buyNowPrice: 10,
                    isClassified: true,
                    isReserveMet: true,
                    id: 1)]) as! ResponseType
        }
    }
    
    
}
