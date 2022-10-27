//
//  ListView.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 26/10/22.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = ListViewModel()
    var body: some View {
        ScrollView {
            ForEach(viewModel.list) { item in
                Text(item.title)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
