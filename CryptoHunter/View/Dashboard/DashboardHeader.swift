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
    @ObservedObject var viewModel: DashboardViewModel
    var body: some View {
        VStack {
            HStack {
                LineChartView(data: viewModel.getDataForIndex(0),
                              title: viewModel.getSymbolForIndex(0),
                              style: previewChartStyle(up: viewModel.getPercentForIndex(0) > 0),
                              form: CGSize(width: 120, height: 100),
                              rateValue: viewModel.getPercentForIndex(0),
                              dropShadow: false)
                LineChartView(data: viewModel.getDataForIndex(1),
                              title: viewModel.getSymbolForIndex(1),
                              style: previewChartStyle(up: viewModel.getPercentForIndex(1) > 0),
                              form: CGSize(width: 120, height: 100),
                              rateValue: viewModel.getPercentForIndex(1),
                              dropShadow: false)
                LineChartView(data: viewModel.getDataForIndex(2),
                              title: viewModel.getSymbolForIndex(2),
                              style: previewChartStyle(up: viewModel.getPercentForIndex(2) > 0),
                              form: CGSize(width: 120, height: 100),
                              rateValue: viewModel.getPercentForIndex(2),
                              dropShadow: false)
            }.padding(.vertical, 16)
            Text("These are your favorite coins, you can edit it by dragging the coin cell or tapping the top right corner button.")
                .padding(.horizontal)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }

    func previewChartStyle(up: Bool) -> ChartStyle {
        let chartStyle: ChartStyle
        let darkMode: ChartStyle

        let gradient = GradientColor(start: up ? Color("crescentGraphStart") :
                                        Color("descendingGraphStart"),
                                     end: up ? Color("crescentGraphEnd"): Color("descendingGraphEnd") )

        chartStyle = ChartStyle(backgroundColor: Color("backgroundGraphStart"),
                                    accentColor: .pink,
                                    gradientColor: gradient,
                                    textColor: Color("textTabItemUnselected"),
                                    legendTextColor: .pink,
                                    dropShadowColor: .clear)
        darkMode = chartStyle

        chartStyle.darkModeStyle = darkMode

        return chartStyle

    }
}

// struct DashboardHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardHeader()
//            .previewLayout(.fixed(width: 400, height: 300))
//    }
// }
