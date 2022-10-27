//
//  ListViewModel.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 26/10/22.
//

import Foundation
@MainActor
class ListViewModel: ObservableObject {
    let dataFetcher: DataFetcherProtocol
    @Published var list: [ListResponse.ListItem] = []
    
    init(dataFetcher: DataFetcherProtocol = DataFetcher.defaultDataFetcher) {
        self.dataFetcher = dataFetcher
        Task {
            self.list = await fetchData()?.list ?? []
        }
    }
    
    private func fetchData() async -> ListResponse? {
        do {
            let request = DataFetcherRequest(
                url: .latestListings,
                headers: [
                    "Content-Type": "application/x-www-form-urlencoded",
                    "rows": "20"],
                httpMethod: .GET
            )
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try await dataFetcher.request(request, decoder: DataFetcherUtils.defaultDecoder())
        } catch {
            return nil
        }
    }
}
