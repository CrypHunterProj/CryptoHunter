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
            title: "Criptomoedas", image: "Icone-Card-Criptomoedas"
        ),
        InfoCardModel(
            title: "Blockchain", image: "Icone-Card-Blockchain"
        ),
        InfoCardModel(
            title: "Transações", image: "Icone-Card-Transacoes"),
        InfoCardModel(
            title: "Cotações", image: "Icone-Card-Cotacoes"
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
            }

            .navigationTitle("Informações")
        }
    }
}
