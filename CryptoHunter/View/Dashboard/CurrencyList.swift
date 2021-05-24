//
//  CurrencyList.swift
//  CryptoHunter
//
//  Created by Albert on 13/05/21.
//

import SwiftUI

struct CurrencyList: View {
    @State var items: [Currency]

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
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 10/255, green: 40/255, blue: 64/255, opacity: 1), Color.black]),
                                                     startPoint: .topLeading,
                                                     endPoint: .bottomTrailing))
                                .padding(.bottom, -300))
            }
        }
//        .onAppear {
//            CurrencyService.gettingCryptocoins { cryptoCoins in
//                let currencies = cryptoCoins.map { cryptoCoin in
//                    Currency(
//                        id: cryptoCoin.symbol,
//                        name: cryptoCoin.name,
//                         value: Double( Int( cryptoCoin.quote.BRL!.market_cap! * 100 ) ) / 100,
//                        image: "",
//                        percentage: Int(cryptoCoin.quote.BRL!.percent_change_24h ?? 0)
//                    )
//                }
//                self.items = currencies
//            }
//        }
    }
}

// struct CurrencyList_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrencyList()
//    }
// }
