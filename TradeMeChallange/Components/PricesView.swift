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
            if item.isClassified == true,  let buyNowPrice = item.buyNowPrice {
                let titleModel = TextModel(text: "\(buyNowPrice)", font: .footnote, weight: .bold, color: .textDark)
                
                let messageModel = TextModel(text: "BuyNow", font: .footnote, weight: .regular, color: .textLight)
                
                VerticalTextView(titleModel: titleModel, messageModel: messageModel)
                Spacer()
            } else {
                let titleModel = TextModel(text: item.priceDisplay, font: .footnote, weight: .bold, color: .textDark)
                
                let messageModel = TextModel(text: item.isReserveMet == true ? "ReserveMet" : "ReserveNotMet", font: .footnote, weight: .regular, color: .textLight)
                
                VerticalTextView(titleModel: titleModel, messageModel: messageModel)
                Spacer()
            }
        }
    }
}
