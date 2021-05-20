//
//  CurrencyList.swift
//  CryptoHunter
//
//  Created by Albert on 13/05/21.
//

import SwiftUI

struct CurrencyList: View {
    @State var items = [Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                 Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),
                 Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                 Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),
                 Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                 Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),
                 Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                 Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23) ]

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ForEach(items, id: \.self) { item in
                    NavigationLink(destination: CurrencyDetail(currency: item)) {
                        CurrencyCell(currency: item)
                            .frame(height: 80)
                    }
                }
                .padding(.vertical, 24)
                .background(RoundedRectangle(cornerRadius: 24)
                                .fill(Color("background"))
                                .padding(.bottom, -300))
            }
        }
        .onAppear {
            CurrencyService.gettingCryptocoins { cryptoCoins in
                let currencies = cryptoCoins.map { cryptoCoin in
                    Currency(
                        id: cryptoCoin.symbol,
                        name: cryptoCoin.name,
                        value: Double(cryptoCoin.quote.BRL!.market_cap ?? 0),
                        image: "",
                        percentage: Int(cryptoCoin.quote.BRL!.percent_change_24h ?? 0)
                    )
                }
                self.items = currencies
            }
        }
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyList()
    }
}
