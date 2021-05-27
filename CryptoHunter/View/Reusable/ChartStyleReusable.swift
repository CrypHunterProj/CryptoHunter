//
//  ChartStyleReusable.swift
//  CryptoHunter
//
//  Created by aluno on 26/05/21.
//

import SwiftUI
import SwiftUICharts

class ChartStyleReusable {

    static func previewChartStyle(up: Bool, type: String) -> ChartStyle {
        let chartStyle: ChartStyle
        let darkMode: ChartStyle

        let gradient = GradientColor(start: up ? Color("crescentGraphStart") :
                                        Color("descendingGraphStart"),
                                     end: up ? Color("crescentGraphEnd"): Color("descendingGraphEnd") )
        let background = type == "Card" ? Color("backgroundGraphStart") : .clear

        chartStyle = ChartStyle(backgroundColor: background,
                                    accentColor: .pink,
                                    gradientColor: gradient,
                                    textColor: Color("textTabItemUnselected"),
                                    legendTextColor: Color("textTabItemUnselected"),
                                    dropShadowColor: .clear)
        darkMode = chartStyle

        chartStyle.darkModeStyle = darkMode

        return chartStyle

    }
}
