//
//  ContentView.swift
//  CryptoHunter WatchKit Extension
//
//  Created by Albert on 12/05/21.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        LineChartView(data: [1, 12, 4, 15],
                      title: "BTC",
                      form: CGSize(width: 120, height: 100),
                      dropShadow: false)
        LineChartView(data: [1, 12, 4, 15],
                      title: "BTC",
                      form: CGSize(width: 120, height: 100),
                      dropShadow: false)
        LineChartView(data: [1, 12, 4, 15],
                      title: "BTC",
                      form: CGSize(width: 120, height: 100),
                      dropShadow: false)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
