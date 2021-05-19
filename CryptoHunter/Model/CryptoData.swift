//
//  Router.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 17/05/21.
//

import Foundation

struct CryptoData: Codable {
    let data: [CryptoCoin]
}

struct CryptoCoin: Codable {
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