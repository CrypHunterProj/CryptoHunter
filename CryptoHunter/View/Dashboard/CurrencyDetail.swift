//
//  CurrencyDetail.swift
//  CryptoHunter
//
//  Created by Albert on 13/05/21.
//

import SwiftUI
import SwiftUICharts

struct CurrencyDetail: View {

    @ObservedObject var viewModel: DashboardViewModel
    var currency: Currency
    var coin: CryptoCoin

    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        getCurrencyDefaultImage(named: currency.id.lowercased())
                        VStack(alignment: .leading) {
                            Text(currency.name)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(currency.value.currencyFormat)
                                .font(.headline)
                        }
                    }.padding(.leading, 16)
                    LineChartView(data: viewModel.getDataFor(coin: coin),
                                  title: coin.name,
                                  form: ChartForm.large,
                                  rateValue: Int(coin.percentChange24Hrs),
                                  dropShadow: false)
                        .padding(.top, 24)
                }
            }
    }

    func getCurrencyDefaultImage(named: String) -> Image {
        let uiImage =  (UIImage(named: named) ?? UIImage(named: "aeur"))!
        return Image(uiImage: uiImage)
    }
}

// struct CurrencyDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrencyDetail(currency: Currency(id: "", name: "", value: 2000, image: "", percentage: 0))
//    }
// }
