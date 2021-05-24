//
//  Dashboard.swift
//  CrypHunter (iOS)
//
//  Created by Albert on 11/05/21.
//

import UIKit
import SwiftUI

struct Dashboard: View {

    @ObservedObject var viewModel: DashboardViewModel

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.dashboardState == .done {
                DashboardHeader(viewModel: viewModel).zIndex(1)
                Spacer(minLength: 32)
                    CurrencyList(items: viewModel.currency)
                        .navigationBarTitle("Dashboard", displayMode: .large)
            .navigationBarItems(trailing: Button(action: {
                print("Click")
            }, label: {
                Image(systemName: "slider.horizontal.3")
            }))
        }
        }
        }.accentColor(.white)
    }
}

// struct Dashboard_Previews: PreviewProvider {
//    static var previews: some View {
//        Dashboard()
//            .preferredColorScheme(.dark)
//            .previewDevice("iPhone 11")ß
//    }
// }
