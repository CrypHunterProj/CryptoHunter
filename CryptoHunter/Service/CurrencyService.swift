//
//  CurrencyService.swift
//  CrypHunter (iOS)
//
//  Created by Albert on 11/05/21.
//

import Foundation

final class CurrentService {

    static let shared = CurrentService()

    private struct Constants {
        static let apiKey = "B34BA97B-E5E2-4C0E-9194-2DB4D110EEFB"
        static let endpoint = "https://rest.coinapi.io/v1/assets/?apikey=\(apiKey)"
        static let assetEndpoint = ""
    }

    private init () {}


    // MARK: - Public
    public func getAllCryptoData(completion: @escaping (Result<[CryptoData], Error>) -> Void) {

        guard let url = URL(string: Constants.endpoint) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let cryptos = try JSONDecoder().decode([CryptoData].self, from: data)
                let sortedCryptos = cryptos.sorted { first, second -> Bool in
                    return first.price_usd ?? 0 > second.price_usd ?? 0
                }
                completion(.success(sortedCryptos))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
