//
//  ListingsViewModel.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 26/10/22.
//

import Foundation

struct AlertContent {
    let title: String
    let message: String
}

enum ListingsViewAlertTypes {
    case error, cart, search, custom(title: String, message: String)
    
    func createAlertContent() -> AlertContent {
        switch self {
        case .error:
            return AlertContent(title: "ErrorTitle", message: "ErrorMessage")
        case .cart:
            return AlertContent(title: "CartTitle", message: "CartMessage")
        case .search:
            return AlertContent(title: "SearchTitle", message: "SearchMessage")
        case .custom(let title, let message):
            return AlertContent(title: title, message: message)
        }
    }
}

class ListingsViewModel: ObservableObject {
    let dataFetcher: DataFetcherProtocol
    @Published var listings: [ListingsResponse.ListItem] = []
    @Published var shouldShowAlert: Bool = false
    @Published var showLoading: Bool = true
    private(set) var alertContent: ListingsViewAlertTypes?
    
    init(dataFetcher: DataFetcherProtocol = DataFetcher.defaultDataFetcher) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchListings() async {
        do {
            await MainActor.run {
                self.showLoading = true
            }
            let request = DataFetcherRequest(
                endpoint: .latestListings(rows: "20"),
                headers: [
                    "Content-Type": "application/x-www-form-urlencoded",
                    "rows": "20"],
                httpMethod: .GET
            )
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response: ListingsResponse = try await dataFetcher.request(request, decoder: DataFetcherUtils.defaultDecoder())
            
            await MainActor.run {
                self.listings = response.list ?? []
                self.showLoading = false
            }
        } catch {
            guard let error = error as? DataFetcherError else {
                self.alertContent = .error
                await MainActor.run {
                    self.shouldShowAlert = true
                    self.showLoading = false
                }
                return
            }
            self.alertContent = .custom(title: error.title, message: error.message)
            await MainActor.run {
                self.shouldShowAlert = true
                self.showLoading = false
            }
        }
    }
    
    func showAlert(type: ListingsViewAlertTypes) {
        self.alertContent = type
        self.shouldShowAlert = true
    }
}
