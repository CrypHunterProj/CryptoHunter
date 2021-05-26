//
//  CurrencyList.swift
//  CryptoHunter
//
//  Created by Albert on 13/05/21.
//

import SwiftUI

struct CurrencyList: View {

    @ObservedObject var viewModel: DashboardViewModel
    var items: [Currency] {
        viewModel.currency
    }

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ForEach(items, id: \.self) { item in
                    NavigationLink(destination:
                        CurrencyDetail(viewModel: viewModel,
                                       currency: item,
                                       coin: viewModel.criptoCoins[items.firstIndex(of: item) ?? 0])) {
                        CurrencyCell(currency: item)
                            .frame(height: 80)
                    }
                }
                .padding(.vertical, 24)
                .background(RoundedRectangle(cornerRadius: 24)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color("backgroundStart"), Color("backgroundEnd")]
                                ),
                                                     startPoint: .topLeading,
                                                     endPoint: .bottomTrailing))
                                .padding(.bottom, -300))
            }
        }
    }
}

// struct CurrencyList_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrencyList()
//    }
// }
