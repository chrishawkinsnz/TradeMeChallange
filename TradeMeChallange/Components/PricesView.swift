//
//  PricesView.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 26/10/22.
//

import SwiftUI

struct PricesView: View {
    
    let item: ListingsResponse.ListItem
    
    var body: some View {
        HStack {
            if item.isClassified == true {
                let titleModel = TextModel(text: "\(item.priceDisplay)", font: .footnote, weight: .bold, color: .textDark)
                
                let messageModel = TextModel(text: "Askingprice".localized, font: .footnote, weight: .regular, color: .textLight)
                
                VerticalTextView(titleModel: titleModel, messageModel: messageModel)
                Spacer()
            } else {
                let titleModel = TextModel(text: item.priceDisplay, font: .footnote, weight: .bold, color: .textDark)
                
                let messageModel = TextModel(text: item.isReserveMet == true ? "ReserveMet".localized : "ReserveNotMet".localized, font: .footnote, weight: .regular, color: .textLight)
                
                VerticalTextView(titleModel: titleModel, messageModel: messageModel)
                Spacer()
                if let buyNow = item.buyNowPrice {
                    let titleModel = TextModel(text: "\(buyNow)", font: .footnote, weight: .bold, color: .textDark)
                    
                    let messageModel = TextModel(text: "BuyNow".localized, font: .footnote, weight: .regular, color: .textLight)
                    
                    VerticalTextView(titleModel: titleModel, messageModel: messageModel)
                }

            }
        }
    }
}
