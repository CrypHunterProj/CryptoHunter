//
//  CurrencyList.swift
//  CryptoHunter
//
//  Created by Albert on 13/05/21.
//

import SwiftUI

struct CurrencyList: View {
    let items = [Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                 Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),
                 Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                 Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),
                 Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                 Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),
                 Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                 Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),]
    
    var body: some View {
        ZStack {
            ScrollView {
                ForEach(items, id: \.self) { item in
                    NavigationLink(destination: CurrencyDetail(currency: item)) {
                        CurrencyCell(currency: item)
                            .frame(height: 80)
                    }
                }
                .padding(.vertical, 24)
                .background(RoundedRectangle(cornerRadius: 24).padding(.bottom, -300))
            }
        }
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyList()
    }
}
