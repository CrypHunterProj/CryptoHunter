//
//  Router.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 17/05/21.
//

import Foundation

struct CryptoData: Codable, Equatable {
    let data: [CryptoCoin]
}

struct CryptoCoin: Codable, Equatable {

    static func == (lhs: CryptoCoin, rhs: CryptoCoin) -> Bool {
        return lhs.id == rhs.id
    }

    let id: Int
    let name: String
    let symbol: String
    let cmc_rank: Int
    let quote: CryptoQuote

}

struct CryptoQuote: Codable {
    let BRL: CryptoValue?
}

struct CryptoValue: Codable {
    let price: Double?
    let volume_24h: Double?
    let percent_change_1h: Double?
    let percent_change_24h: Double?
    let percent_change_7d: Double?
    let percent_change_30d: Double?
    let percent_change_60d: Double?
    let percent_change_90d: Double?
    let market_cap: Double?
}

extension CryptoCoin {
    public var priceBRL: Double {
        return self.quote.BRL?.price ?? 0
    }
    public var percentChange24Hrs: Double {
        return self.quote.BRL?.percent_change_24h ?? 0
    }
}
