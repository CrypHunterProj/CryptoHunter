//
//  Information.swift
//  CrypHunter (iOS)
//
//  Created by Albert on 11/05/21.
//

import SwiftUI

struct Information: View {

    let infoCards = [
        InfoCardModel(
            title: "Criptomoedas", image: "bitcoinsign.circle.fill"
        ),
        InfoCardModel(
            title: "Blockchain", image: "bitcoinsign.circle.fill"
        ),
        InfoCardModel(
            title: "Transações", image: "bitcoinsign.circle.fill"),
        InfoCardModel(
            title: "Cotações", image: "bitcoinsign.circle.fill"
        )
    ]

    var body: some View {
        NavigationView {

            ScrollView {
                ForEach(infoCards, id: \.self) { info in
                    NavigationLink(destination: InfoDetail(infoDetail: info)) {
                        InfoCardView(model: info)
                    }
                    .foregroundColor(.white)
                }
            /*  DEBUG
                .onAppear(perform: {
                    let fetchInfo = FetchInformation()
                    let information = fetchInfo.parseJson(filename: "Informacoes")
                    print(information)
                })
            */
                //  DEBUG
                    .onAppear(perform: {

//                        CurrencyService.request() { result in
//                            switch result {
//                            case .success(let result):
//                                print(result)
//                            case .failure(let error):
//                                print(error)
//                            }
//                        }

//                        do {
//
//                            let blz = try JSONDecoder().decode(
//                                CryptoData.self,
//                                from:
//                                    try Data(
//                                        contentsOf:
//                                            Bundle.main.url(
//                                                forResource: "Coinmarketcap",
//                                                withExtension: "json"
//                                            )!
//                                    )
//                            )
//
//                            let rankblz = blz.data.filter { $0.cmc_rank <= 100 }.sorted { $0.cmc_rank < $1.cmc_rank }
//
//                            print("\n\n👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺\n\n")
//                            for b in rankblz {
//                                print("\(b.name) \(b.quote.BRL!.price)")
//                            }
//
//                            print("\n\n🥺🥺🥺🥺🥺🥺🥺🥺")
//                            print("total -", rankblz.count)
//                            print("1h -", rankblz.filter { c in return c.quote.BRL!.percent_change_1h != 0 }.count)
//                            print("24h -", rankblz.filter { c in return c.quote.BRL!.percent_change_24h != 0 }.count)
//                            print("7d -", rankblz.filter { c in return c.quote.BRL!.percent_change_7d != 0 }.count)
//                            print("30d -", rankblz.filter { c in return c.quote.BRL!.percent_change_30d != 0 }.count)
//                            print("60d - ", rankblz.filter { c in return c.quote.BRL!.percent_change_60d != 0 }.count)
//                            print("90d -", rankblz.filter { c in return c.quote.BRL!.percent_change_90d != 0 }.count)
//                            print("market_cap -", rankblz.filter { c in return c.quote.BRL!.market_cap != 0 }.count)
//                            print("price -", rankblz.filter { c in return c.quote.BRL!.price != 0 }.count)
//
//                            print("\n\n🧐")
//
//                            print("30d -", rankblz.filter { c in return c.quote.BRL!.percent_change_30d != 0 }.map { $0.name })
//                            print("60d - ", rankblz.filter { c in return c.quote.BRL!.percent_change_60d != 0 }.map { $0.name })
//                            print("90d -", rankblz.filter { c in return c.quote.BRL!.percent_change_90d != 0 }.map { $0.name })
//
//
//                        } catch {
//                            print(error)
//                        }

//                        CurrentService.shared.getAllCryptoData {  result in
//                            switch result {
//                            case .success(let sortedCryptos):
//                                print("\n|-----------------------------------|")
//                                print("\nINFORMATION CRYPTOS\n")
//                                print(sortedCryptos.first)
//                            case .failure(let error):
//                                print(error)
//                            }
//                        }
                    })
            }

            .navigationTitle("Informações")
        }
    }
}
