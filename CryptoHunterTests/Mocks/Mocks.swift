//
//  Mocks.swift
//  CryptoHunterTests
//
//  Created by Alley Pereira on 25/05/21.
//
// swiftlint:disable force_try

import Foundation
@testable import CryptoHunter

struct Mocks {

    static let json = CryptoData(
        data: [
            CryptoCoin(
                id: 1,
                name: "Banano",
                symbol: "BNC",
                cmc_rank: 25,
                quote:
                    CryptoQuote(
                        BRL:
                            CryptoValue(
                                price: 200,
                                volume_24h: 250,
                                percent_change_1h: 0.01,
                                percent_change_24h: 3.45,
                                percent_change_7d: nil,
                                percent_change_30d: nil,
                                percent_change_60d: nil,
                                percent_change_90d: nil,
                                market_cap: 1000
                            )
                    )
            ),
            CryptoCoin(
                id: 1,
                name: "Mock Coin",
                symbol: "MKC",
                cmc_rank: 13,
                quote:
                    CryptoQuote(
                        BRL:
                            CryptoValue(
                                price: 200,
                                volume_24h: 250,
                                percent_change_1h: 0.01,
                                percent_change_24h: 3.45,
                                percent_change_7d: nil,
                                percent_change_30d: nil,
                                percent_change_60d: nil,
                                percent_change_90d: nil,
                                market_cap: 1000
                            )
                    )
            ),
            CryptoCoin(
                id: 1,
                name: "Evil Coin",
                symbol: "EVV",
                cmc_rank: 1,
                quote:
                    CryptoQuote(
                        BRL:
                            CryptoValue(
                                price: 200,
                                volume_24h: 250,
                                percent_change_1h: 0.01,
                                percent_change_24h: 3.45,
                                percent_change_7d: nil,
                                percent_change_30d: nil,
                                percent_change_60d: nil,
                                percent_change_90d: nil,
                                market_cap: 1000
                            )
                    )
            )
        ]
    )

    static let wrongFileMock: String = "👺👺👺"

    private static func gettingListingFilename() -> String {
        let dateComponents = Calendar.current.dateComponents([ .day, .month, .year ], from: Date())
        let dateListeningCurrency: String = "\(dateComponents.day!)-\(dateComponents.month!)-\(dateComponents.year!)_ListingsCryptocurrency.json"
        return dateListeningCurrency
    }

    static func setUpMockFileForToday() {

        let data = try! JSONEncoder().encode(json)

        // Gerando caminho para o arquivo do dia atual
        let documentsURL: URL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
        let fileURL: URL = documentsURL.appendingPathComponent(gettingListingFilename())

        // Persistindo data no caminho
        try! data.write(to: fileURL)
    }

    static func setUpMockWrongFileForToday() {

        guard let data = wrongFileMock.data(using: .utf8) else {
            print("🥺 Wrong File Mock could not be parsed to Data type")
            return
        }

        // Gerando caminho para o arquivo do dia atual
        let documentsURL: URL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!
        let fileURL: URL = documentsURL.appendingPathComponent(gettingListingFilename())

        // Persistindo data no caminho
        do {
            try data.write(to: fileURL)
        } catch {
            print(error, "🥺 Wrong File Mock")
        }
    }

    static func tearDownMockFileForToday() {
        let filename = gettingListingFilename()
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first!.appendingPathComponent(filename)
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("Removed Successfully")
        } catch {
            print(error, "🥺 Mock File")
        }
    }
}
