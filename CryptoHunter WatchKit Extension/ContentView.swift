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
        List {
        LineChartView(data: [1, 12, 4, 15],
                      title: "BTC",
                      form: CGSize(width: 158, height: 90),
                      dropShadow: false)
            .allowsHitTesting(false)
            .listRowBackground(Color.clear)
        LineChartView(data: [1, 12, 4, 15],
                      title: "BTC",
                      form: CGSize(width: 158, height: 90),
                      dropShadow: false)
            .allowsHitTesting(false)
            .listRowBackground(Color.clear)
        LineChartView(data: [1, 12, 4, 15],
                      title: "BTC",
                      form: CGSize(width: 158, height: 90),
                      dropShadow: false)
            .allowsHitTesting(false)
            .listRowBackground(Color.clear)
        }
        .listStyle(CarouselListStyle())
    }
}

// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewModel: viewmod)
//    }
// }
