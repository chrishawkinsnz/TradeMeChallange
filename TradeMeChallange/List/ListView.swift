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
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(viewModel.list) { item in
                    VStack {
                        Button(action: {
                            viewModel.showAlert(title: "TappedOn", message: item.title)                            
                        }) {
                            HStack {
                                AsyncImage(url: URL(string: item.pictureHref ?? ""),
                                           content: { image in
                                    image
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                },
                                           placeholder: {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 100, height: 100)
                                })
                                
                                VStack(alignment: .leading) {
                                    let titleModel = TextModel(text: item.region, font: .footnote, weight: .regular, color: .textLight)
                                    
                                    let messageModel = TextModel(text: item.title, font: .footnote, weight: .bold, color: .textDark)
                                    
                                    VerticalTextView(titleModel: titleModel, messageModel: messageModel)
                                    
                                    Spacer()
                                    
                                    PricesView(item: item)
                                }
                                
                            }
                            .frame(maxWidth: .infinity)
                        }
                        Rectangle()
                            .fill(Color.textLight)
                            .opacity(0.3)
                            .frame(height: 1)
                            .padding(.top, 2)
                        
                    }
                    
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
