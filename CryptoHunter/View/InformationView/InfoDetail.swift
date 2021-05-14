//
//  InfoDetail.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 13/05/21.
//

import SwiftUI

struct InfoDetail: View {
    var infoDetail: InfoCardModel

    @State private var information: InformationData?

    var body: some View {
        NavigationView {
            List {
                //usar information nas views
            }
        }.navigationTitle(Text(infoDetail.title))
        .onAppear(perform: {
            let fetchInfo = FetchInformation()
            let informationDataArray = fetchInfo.parseJson(filename: "Informacoes")
            print(informationDataArray)

            //filtrar o informationArray e pegar só o da Tela que vc entrou (Criptomoeads, Blockchain, ...)
            let informationData = informationDataArray.first(where: { informationData in
                return informationData.topic == infoDetail.title
            })

            //atribuir o InformationData especifico a variavel information
            self.information = informationData
        })
    }
}
