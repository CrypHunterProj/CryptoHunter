//
//  CurrencyDetail.swift
//  CryptoHunter
//
//  Created by Albert on 13/05/21.
//

import SwiftUI

struct CurrencyDetail: View {
    var currency: Currency

    var body: some View {
        NavigationView {
            List {

            }
        }.navigationBarTitle(Text(currency.name), displayMode: .large)
    }
}

struct CurrencyDetail_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyDetail(currency: Currency(id: "", name: "", value: 2000, image: "", percentage: 0, isFavorite: false))
    }
}
