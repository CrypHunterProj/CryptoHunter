//
//  CurrencyDetail.swift
//  CryptoHunter
//
//  Created by Albert on 13/05/21.
//

import SwiftUI
import SwiftUICharts

struct CurrencyDetail: View {
    var currency: Currency

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
                    LineChartView(data: [42.2, 26.4, 36.5, 55.3],
                                  title: "BRL",
                                  form: ChartForm.large,
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

struct CurrencyDetail_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyDetail(currency: Currency(id: "", name: "", value: 2000, image: "", percentage: 0))
    }
}
