//
//  CoinMarketCapRouter.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 19/05/21.
//

import Foundation

struct CoinMarketCapRouter {

    private init() { }

    static var urlRequest: URLRequest {
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        return request
    }

    private static let url: URL = URL(
        string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100&convert=BRL"
    )!

    private static var header: [String: String] {
        switch self {
        default:
            return [
                "Accepts": "application/json",
                "X-CMC_PRO_API_KEY": "89fe9de0-0581-4265-812e-84c7e2b2f59a"
            ]
        }
    }
}
