//
//  DashboardViewModel.swift
//  CrypHunter (iOS)
//
//  Created by Albert on 11/05/21.
//

import Foundation
import WatchConnectivity

class DashboardViewModel: ObservableObject {

    var provider: WatchConnectionProvider
    @Published var criptoCoins: [CryptoCoin] = []
    @Published private(set) var dashboardState = State.loading

    init(provider: WatchConnectionProvider) {
        self.provider = provider
        self.getAll()
    }
}

extension DashboardViewModel {

    enum State {case loading, error, done}

    func sendFileToWatch() {
    }

    func getAll() {
        CurrencyService.gettingCryptocoins { (coins) in
            coins.forEach {
                self.criptoCoins.append($0)
            }
            self.dashboardState = .done
        }
    }

    public var numberOfCoins: Int {
        self.criptoCoins.count
    }

    func getDataForIndex(_ index: Int) -> [Double] {
        if index <= self.numberOfCoins {
            let coin = self.criptoCoins[index]
            return self.getDataFor(coin: coin)
        } else {
            return [0.0]
        }
    }

    func getDataFor(coin: CryptoCoin) -> [Double] {
        let quote = coin.quote.BRL!
        var data: [Double] = []
        let last = quote.price! * quote.percent_change_24h!
        data.append(last)
        data.append(quote.price!)
        return data
    }

    func getPercentForIndex(_ index: Int) -> Int {
        if index <= self.numberOfCoins {
            let coin = self.criptoCoins[index]
            return Int((coin.quote.BRL?.percent_change_24h)!)
        } else {
            return 0
        }
    }
    func getSymbolForIndex(_ index: Int) -> String {
        if index <= self.numberOfCoins {
            let coin = self.criptoCoins[index]
            return coin.symbol
        } else {
            return " "
        }
    }

    func getCurrencyFromCoin() -> [Currency] {
        var arrayOfCurrency: [Currency] = []
        self.criptoCoins.forEach {
            arrayOfCurrency.append(Currency.init(id: $0.symbol, name: $0.name, value: ($0.quote.BRL?.price)!, image: "AppIcon", percentage: Int(($0.quote.BRL?.percent_change_24h)!)))
        }
        return arrayOfCurrency
    }
}
