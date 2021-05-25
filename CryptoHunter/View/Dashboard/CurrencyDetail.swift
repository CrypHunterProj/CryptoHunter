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
                            .resizable()
                            .frame(width: 56, height: 56)
                        VStack(alignment: .leading) {
                            Text(currency.name)
                                .font(.title3)
                                .foregroundColor(.secondary)
                            Text(currency.value.currencyFormat)
                                .font(.title2)
                                .bold()
                        }
                    }.padding(.leading, 4)
                    LineView(data: viewModel.getDataFor(coin: coin),
                             title: "BRL",
                             legend: "Week")
                    Text("The chart shows the variation of the week for the choosen currency, the data is reloaded once per day.")
                        .padding(.horizontal, 4)
                        .padding(.top, 380)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)

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
