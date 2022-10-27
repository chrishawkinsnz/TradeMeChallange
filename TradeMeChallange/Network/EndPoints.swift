//
//  EndPoints.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 26/10/22.
//

import Foundation

enum EndPoint {
    case latestListings(rows: String)
    func buildUrl() -> URL? {
        switch self {
        case .latestListings(let rows):
            var url = URL(string: "https://api.tmsandbox.co.nz/v1/listings/latest.json")
            url?.append(queryItems: [URLQueryItem(name: "rows", value: rows)])
            return url
        }
    }
}
