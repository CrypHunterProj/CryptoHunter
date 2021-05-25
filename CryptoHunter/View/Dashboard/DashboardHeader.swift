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
            LineChartView(data: [1, 12, 4, 15],
                          title: "BTC",
                          style: previewChartStyle(up: true),
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
    }

    func previewChartStyle(up: Bool) -> ChartStyle {
        let chartStyle: ChartStyle
        let darkMode: ChartStyle

        let gradient = GradientColor(start: up ? Color("crescentGraphStart") :
                                        Color("descendingGraphStart"),
                                     end: up ? Color("crescentGraphEnd"): Color("descendingGraphEnd") )

        chartStyle = ChartStyle(backgroundColor: Color("backgroundGraphStart"),
                                    accentColor: .pink,
                                    gradientColor: GradientColor(start: up ? .green :
                                                                    .red,
                                        end: up ?
                                            .gray: .pink),
                                    textColor: Color("textTabItemUnselected"),
                                    legendTextColor: .pink,
                                    dropShadowColor: .clear)
        darkMode = chartStyle

        chartStyle.darkModeStyle = darkMode

        return chartStyle

    }
}

struct DashboardHeader_Previews: PreviewProvider {
    static var previews: some View {
        DashboardHeader()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
