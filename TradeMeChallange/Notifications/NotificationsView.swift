//
//  NotificationsView.swift
//  TradeMeChallange
//
//  Created by Inti Albuquerque on 28/10/22.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        Text("Notifications")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .navigationBarTitle(Text("Notifications"))
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
