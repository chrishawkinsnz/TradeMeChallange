//
//  WatchListView.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 16/10/22.
//

import SwiftUI

struct WatchListView: View {
    var body: some View {
        Text("Watchlist")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .navigationBarTitle(Text("Watchlist"))
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
