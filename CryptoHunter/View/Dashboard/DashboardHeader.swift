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
        }.padding(.vertical, 16)
    }
}

struct DashboardHeader_Previews: PreviewProvider {
    static var previews: some View {
        DashboardHeader()
    }
}
