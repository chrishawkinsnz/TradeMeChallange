//
//  ListingsView.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 26/10/22.
//

import SwiftUI

struct ListingsView: View {
    @StateObject var viewModel = ListingsViewModel()
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(viewModel.list) { item in
                    ListingComponentView(model: ListComponentViewModel(buttonAction: { viewModel.showAlert(title: "TappedOn", message: item.title) }, item: item))
                }
            }
            .padding(.horizontal, 16)
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

struct ListingsView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsView()
    }
}
