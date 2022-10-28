//
//  String+Localized.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 26/10/22.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
