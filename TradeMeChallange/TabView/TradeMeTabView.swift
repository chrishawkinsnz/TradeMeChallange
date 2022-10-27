//
//  TradeMeTabView.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 26/10/22.
//

import SwiftUI

struct TradeMeTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                ListingsView()
            }
            .tabItem {
                VStack {
                    Image(iconName: .search)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("LatestListings")
                }
            }
            
            
            NavigationView {
                Text("lol")
            }
            .tabItem {
                VStack {
                    Image(iconName: .watchlist)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Watchlist")
                }
            }
            
            
            NavigationView {
                Text("lol")
            }
            .tabItem {
                VStack {
                    Image(iconName: .profile)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("MyTradeMe")
                }
            }
            
            
        }
    }
}

struct TradeMeTabView_Previews: PreviewProvider {
    static var previews: some View {
        TradeMeTabView()
    }
}
