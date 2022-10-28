//
//  Image+Icons.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 26/10/22.
//

import Foundation
import SwiftUI
enum IconName: String {
    case profile, cart, search, watchlist, bell
}

extension Image {
    init(iconName: IconName) {
        self.init(iconName.rawValue)
    }
}
