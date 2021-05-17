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
                        CurrentService.shared.getAllCryptoData {  result in
                            switch result {
                            case .success(let sortedCryptos):
                                print("\n|-----------------------------------|")
                                print("\nINFORMATION CRYPTOS\n")
                                print(sortedCryptos.first)
                            case .failure(let error):
                                print(error)
                            }
                        }
                    })
            }

            .navigationTitle("Informações")
        }
    }
}
