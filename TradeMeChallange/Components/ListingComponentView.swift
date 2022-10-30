//
//  ListingComponentView.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 27/10/22.
//

import SwiftUI

struct ListComponentViewModel {
    let buttonAction: () -> Void
    let item: ListingsResponse.ListItem
}

struct ListingComponentView: View {
    let model:  ListComponentViewModel
    var body: some View {
        VStack {
            Button(action: {
                model.buttonAction()
            }) {
                HStack {
                    AsyncImage(url: URL(string: model.item.pictureHref ?? ""),
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
                        let titleModel = TextModel(text: model.item.region, font: .footnote, weight: .regular, color: .textLight)
                        
                        let messageModel = TextModel(text: model.item.title, font: .footnote, weight: .bold, color: .textDark)
                        
                        VerticalTextView(titleModel: titleModel, messageModel: messageModel)
                        
                        Spacer()
                        
                        PricesView(item: model.item)
                    }
                    
                }
                .frame(maxWidth: .infinity)
            }
            Rectangle()
                .fill(Color.textLight)
                .opacity(0.3)
                .frame(height: 1)
                .padding(.top, 2)
            // TODOJ is there a simpler way to do this?
            // TODOJ god I wish our real search result cells were this clean.
        }
    }
}
