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
                        InfoCardView.init(model: info)
                    }
                    .foregroundColor(.white)
                }
            }

            .navigationTitle("Informações")
        }
    }
}
