//
//  DashboardHeader.swift
//  CryptoHunter
//
//  Created by Albert on 13/05/21.
//
// Charts Resources: https://github.com/AppPear/ChartView

import SwiftUI
import SwiftUICharts

struct DashboardHeader: View {
    var body: some View {
        VStack {
            HStack {
                LineChartView(data: [1, 12, 4, 15],
                              title: "BTC",
                              form: CGSize(width: 120, height: 100),
                              dropShadow: false)
                LineChartView(data: [20, 12, 44, 15],
                              title: "ETH",
                              form: CGSize(width: 120, height: 100),
                              dropShadow: false)
                LineChartView(data: [12, 12, 4, 15],
                              title: "ADV",
                              form: CGSize(width: 120, height: 100),
                              dropShadow: false)
            }.padding(.vertical, 16)
            Text("These are your favorite coins, you can edit it by dragging the coin cell or tapping the top right corner button.")
                .padding(.horizontal)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

struct DashboardHeader_Previews: PreviewProvider {
    static var previews: some View {
        DashboardHeader()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
