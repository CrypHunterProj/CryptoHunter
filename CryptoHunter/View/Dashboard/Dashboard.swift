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
        let viewModel = DashboardViewModel()
        NavigationView {
            VStack {
                DashboardHeader()
                    .zIndex(1)
                CurrencyList()
                    .zIndex(0)
            }
            .navigationBarTitle("Dashboard", displayMode: .large)
            .navigationBarItems(trailing: Button("Edit") {}
            )
        }
    }
}



struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
            .previewDevice("iPhone 11")
    }
}
