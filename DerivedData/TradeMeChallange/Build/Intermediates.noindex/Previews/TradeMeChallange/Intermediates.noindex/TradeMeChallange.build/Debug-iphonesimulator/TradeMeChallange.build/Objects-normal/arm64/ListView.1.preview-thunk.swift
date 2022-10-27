@_private(sourceFile: "ListView.swift") import TradeMeChallange
import SwiftUI
import SwiftUI

extension ListView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/intialbuquerque/projects/TradeMeChallange/TradeMeChallange/List/ListView.swift", line: 23)
        ListView()
    
#sourceLocation()
    }
}

extension ListView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/intialbuquerque/projects/TradeMeChallange/TradeMeChallange/List/ListView.swift", line: 13)
        ScrollView {
            ForEach(viewModel.list) { item in
                Text(item.title)
            }
        }
    
#sourceLocation()
    }
}

import struct TradeMeChallange.ListView
import struct TradeMeChallange.ListView_Previews
