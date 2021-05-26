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
    var criptoCoins: [CryptoCoin] = []
   var currency: [Currency] = []
    @Published private(set) var dashboardState = State.loading

    init(provider: WatchConnectionProvider) {
        self.provider = provider
        self.getAll()
    }
}

extension DashboardViewModel {

    enum State {case loading, error, done}

    func sendDataToWatch() {
        let dataToSend = prepareToSend()
        provider.send(message: dataToSend)
    }

    func getAll() {
        CurrencyService.gettingCryptocoins { (coins) in
            coins.forEach {
                self.criptoCoins.append($0)
            }
            self.getCurrencyFromCoin()
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
        var data: [Double] = []
        let last = (coin.priceBRL) * (coin.percentChange24Hrs)
        data.append(last)
        data.append(coin.priceBRL)
        return data
    }

    func getPercentForIndex(_ index: Int) -> Int {
        if index <= self.numberOfCoins {
            let coin = self.criptoCoins[index]
            return Int(coin.percentChange24Hrs)
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

    func getCurrencyFromCoin() {
        self.criptoCoins.forEach {
            self.currency.append(Currency.init(id: $0.symbol, name: $0.name, value: ($0.priceBRL), image: "AppIcon", percentage: Int($0.percentChange24Hrs), isFavorite: false))
        }
    }

    func prepareToSend() -> [String: Any] {
        var siglas: [String] = []
        var percent: [Int] = []
        var data: [Double] = []
        var value: [Double] = []

        for i in 0...2 {
            siglas.append(self.getSymbolForIndex(i))
            percent.append(self.getPercentForIndex(i))
            data.append(contentsOf: self.getDataForIndex(i))
            value.append(self.currency[i].value)
        }
        let object: [String: Any] = ["Siglas": siglas, "Percent": percent, "Data": data, "Value": value]
        return object
    }
}
