//
//  ContentView.swift
//  CryptoHunter WatchKit Extension
//
//  Created by Albert on 12/05/21.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        switch self.viewModel.state {
        case .start:
            ChargeView(viewModel: self.viewModel)
        case .done:
            GraphsList(viewModel: self.viewModel)
        default:
            self
        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewModel: ViewModel())
//    }
// }
