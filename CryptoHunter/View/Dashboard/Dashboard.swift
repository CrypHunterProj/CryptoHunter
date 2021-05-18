//
//  Dashboard.swift
//  CrypHunter (iOS)
//
//  Created by Albert on 11/05/21.
//

import UIKit
import SwiftUI

struct Dashboard: View {
    var body: some View {
        NavigationView {
            VStack {
                DashboardHeader().zIndex(1)
                Spacer(minLength: 32)
                CurrencyList()
            }
            .navigationBarTitle("Dashboard", displayMode: .automatic)
            .navigationBarItems(trailing: Button("Edit") {})
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11")
    }
}
