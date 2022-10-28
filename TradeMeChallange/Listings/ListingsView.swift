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
        if viewModel.showLoading {
            LottieView(name: .loading)
                .onAppear {
                    Task {
                        await viewModel.fetchListings()
                    }
                }
                .navigationBarTitle(Text("Browse"))
                .toolbar {
                    toolBar
                }
                .navigationBarTitleDisplayMode(.inline)
                .alert(isPresented: $viewModel.shouldShowAlert) {
                    Alert(title: Text(viewModel.alertContent?.createAlertContent().title.localized ?? ""), message: Text(viewModel.alertContent?.createAlertContent().message.localized ?? ""))
                }
        } else {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.listings) { item in
                        ListingComponentView(model: ListComponentViewModel(buttonAction: { viewModel.showAlert(type: .custom(title: "TappedOn", message: item.title)) }, item: item))
                            .accessibilityIdentifier("item\(viewModel.listings.firstIndex(where: { $0.id == item.id})!)")
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle(Text("Browse"))
            .toolbar {
                toolBar
            }
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $viewModel.shouldShowAlert) {
                Alert(title: Text(viewModel.alertContent?.createAlertContent().title.localized ?? ""), message: Text(viewModel.alertContent?.createAlertContent().message.localized ?? ""))
            }
        }
    }
    
    @ViewBuilder
    var toolBar: some View {
        HStack {
            Button(action: {
                viewModel.showAlert(type: .cart)
            }) {
                Image(iconName: .cart)
                    .renderingMode(.template)
                    .foregroundColor(.tasman)
            }
            .accessibilityIdentifier("cart")
            
            Button(action: {
                viewModel.showAlert(type: .search)
            }) {
                Image(iconName: .search)
                    .renderingMode(.template)
                    .foregroundColor(.tasman)
            }
            .accessibilityIdentifier("search")
        }
    }
}

struct ListingsView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsView()
    }
}
