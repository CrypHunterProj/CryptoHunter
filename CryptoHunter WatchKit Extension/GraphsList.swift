//
//  GraphsList.swift
//  CryptoHunter WatchKit Extension
//
//  Created by Fernando de Lucas da Silva Gomes on 25/05/21.
//

import SwiftUI
import SwiftUICharts

struct GraphsList: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        if viewModel.state == .done {
            List {
                ZStack {
                    LineChartView(data: [viewModel.response.data[0], viewModel.response.data[1]],
                                  title: viewModel.response.siglas[0],
                              form: CGSize(width: 158, height: 90),
                              rateValue: viewModel.response.percent[0],
                              dropShadow: false)
                        .allowsHitTesting(false)
                        .listRowBackground(Color.clear)

                    HStack {
                        Text("\(viewModel.response.value[0].currencyFormat)")
                            .font(Font.system(size: 10).bold())
                            .lineLimit(1)
                            .truncationMode(.middle)
                            .allowsTightening(true)
                            .minimumScaleFactor(0.1)
                            .padding(.init(top: -45, leading: 72, bottom: 0, trailing: 0))
                    }
                }.listRowBackground(Color.clear)
                .padding()

                ZStack {
                    LineChartView(data: [viewModel.response.data[2], viewModel.response.data[3]],
                                  title: viewModel.response.siglas[1],
                              form: CGSize(width: 158, height: 90),
                              rateValue: viewModel.response.percent[1],
                              dropShadow: false)
                        .allowsHitTesting(false)
                        .listRowBackground(Color.clear)
                    HStack {
                        Text("\(viewModel.response.value[1].currencyFormat)")
                            .font(Font.system(size: 10).bold())
                            .lineLimit(1)
                            .truncationMode(.middle)
                            .allowsTightening(true)
                            .minimumScaleFactor(0.1)
                            .padding(.init(top: -45, leading: 72, bottom: 0, trailing: 0))
                    }
                }.listRowBackground(Color.clear)
                .padding()

                ZStack {
                    LineChartView(data: [viewModel.response.data[4], viewModel.response.data[5]],
                                  title: viewModel.response.siglas[2],
                              form: CGSize(width: 158, height: 90),
                              rateValue: viewModel.response.percent[2],
                              dropShadow: false)
                        .allowsHitTesting(false)
                        .listRowBackground(Color.clear)
                    HStack {
                        Text("\(viewModel.response.value[2].currencyFormat)")
                            .font(Font.system(size: 10).bold())
                            .lineLimit(1)
                            .truncationMode(.middle)
                            .allowsTightening(true)
                            .minimumScaleFactor(0.1)
                            .padding(.init(top: -45, leading: 72, bottom: 0, trailing: 0))
                    }
                }.listRowBackground(Color.clear)
                .padding()
            }
            .listStyle(CarouselListStyle())
            .animation(.easeIn)
    }
    }
}
