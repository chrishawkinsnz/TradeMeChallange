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

class ListingsViewModel: ObservableObject {
    let dataFetcher: DataFetcherProtocol
    @Published var list: [ListingsResponse.ListItem] = []
    @Published var shouldShowAlert: Bool = false
    private(set) var alertContent: AlertContent?
    
    init(dataFetcher: DataFetcherProtocol = DataFetcher.defaultDataFetcher) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchListings() async {
        do {
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
                self.list = response.list ?? []
            }
        } catch {
            print(error)
        }
    }
    
    func showAlert(title: String, message: String) {
        self.alertContent = AlertContent(title: title, message: message)
        self.shouldShowAlert = true
    }
}
