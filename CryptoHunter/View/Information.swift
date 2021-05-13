//
//  Information.swift
//  CrypHunter (iOS)
//
//  Created by Albert on 11/05/21.
//

import SwiftUI

struct Information: View {

    var title: String = "Informacoes"

    var body: some View {
        NavigationView {

            ScrollView {
                InfoCard(model:
                            InfoCardModel(
                                image: "bitcoinsign.circle.fill",
                                title: "Criptomoedas"
                            )
                )
                InfoCard(model:
                            InfoCardModel(
                                image: "bitcoinsign.circle.fill",
                                title: "Blockchain"
                            )
                )
                InfoCard(model:
                            InfoCardModel(
                                image: "bitcoinsign.circle.fill",
                                title: "Transações"))
                InfoCard(model:
                            InfoCardModel(
                                image: "bitcoinsign.circle.fill",
                                title: "Cotações"
                            )
                )
            }

            .navigationTitle("Informações")
        }
    }
}

struct InfoCardModel {
    let image: String
    let title: String
}

struct InfoCard: View {

    let model: InfoCardModel

    var body: some View {
        HStack(alignment: .center) {
            Text(model.title).padding(.leading, 20)
            Spacer()
            Image(systemName: model.image)
                .padding(.trailing, 20)
                .font(.system(size: 45))
            
        }
        .frame(maxWidth: 400, minHeight: 90)
        .background(Color.blue)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding()
    }
}


struct Information_Previews: PreviewProvider {
    static var previews: some View {
        Information()
    }
}
