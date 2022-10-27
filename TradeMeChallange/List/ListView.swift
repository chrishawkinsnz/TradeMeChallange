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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            Task {
                await viewModel.fetchListings()
            }
        }
        .navigationBarTitle(Text("LatestListings"))
        .toolbar {
            toolBar
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $viewModel.shouldShowAlert) {
            Alert(title: Text(viewModel.alertContent?.title.localized ?? ""), message: Text(viewModel.alertContent?.message.localized ?? ""))
        }
    }
    
    @ViewBuilder
    var toolBar: some View {
        HStack {
            Button(action: {
                viewModel.showAlert(title: "CartTitle", message: "CartMessage")
            }) {
                Image(iconName: .cart)
                    .renderingMode(.template)
                    .foregroundColor(.tasman)
            }
            
            Button(action: {
                viewModel.showAlert(title: "SearchTitle", message: "SearchMessage")
            }) {
                Image(iconName: .search)
                    .renderingMode(.template)
                    .foregroundColor(.tasman)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
