@_private(sourceFile: "TradeMeTabView.swift") import TradeMeChallange
import SwiftUI
import SwiftUI

extension TradeMeTabView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/intialbuquerque/projects/TradeMeChallange/TradeMeChallange/TabView/TradeMeTabView.swift", line: 61)
        TradeMeTabView()
    
#sourceLocation()
    }
}

extension TradeMeTabView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/intialbuquerque/projects/TradeMeChallange/TradeMeChallange/TabView/TradeMeTabView.swift", line: 12)
        TabView {
            NavigationView {
                ListView()
            }
            .tabItem {
                VStack {
                    Image(iconName: .search)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: __designTimeInteger("#6835.[1].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 24), height: __designTimeInteger("#6835.[1].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[1].value", fallback: 24))
                    Text(__designTimeString("#6835.[1].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "LatestListings"))
                }
            }
            
            
            NavigationView {
                Text(__designTimeString("#6835.[1].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "lol"))
            }
            .tabItem {
                VStack {
                    Image(iconName: .watchlist)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: __designTimeInteger("#6835.[1].[0].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 24), height: __designTimeInteger("#6835.[1].[0].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[1].value", fallback: 24))
                    Text(__designTimeString("#6835.[1].[0].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "Watchlist"))
                }
            }
            
            
            NavigationView {
                Text(__designTimeString("#6835.[1].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value", fallback: "lol"))
            }
            .tabItem {
                VStack {
                    Image(iconName: .profile)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: __designTimeInteger("#6835.[1].[0].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 24), height: __designTimeInteger("#6835.[1].[0].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[1].value", fallback: 24))
                    Text(__designTimeString("#6835.[1].[0].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "MyTradeMe"))
                }
            }
            
            
        }
    
#sourceLocation()
    }
}

import struct TradeMeChallange.TradeMeTabView
import struct TradeMeChallange.TradeMeTabView_Previews
