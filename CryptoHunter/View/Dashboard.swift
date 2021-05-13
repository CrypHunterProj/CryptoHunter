//
//  Dashboard.swift
//  CrypHunter (iOS)
//
//  Created by Albert on 11/05/21.
//
// Charts Resources: https://github.com/AppPear/ChartView

import SwiftUI
import SwiftUICharts

struct Dashboard: View {
    var body: some View {
        VStack {
            HStack {
                LineChartView(data: [1,12,4,15],
                              title: "BTC",
                              form: ChartForm.small)
                LineChartView(data: [20,12,44,15],
                              title: "ETH",
                              form: ChartForm.small)
                LineChartView(data: [12,12,4,15],
                              title: "ADV",
                              form: ChartForm.small)
            }
            List {
                Text("Olá")
                Text("Olá")
                Text("Olá")
            }
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
            .previewDevice("iPhone 11")
    }
}
