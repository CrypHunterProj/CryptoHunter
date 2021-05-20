//
//  InfoDetail.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 13/05/21.
//

import SwiftUI

struct InfoDetail: View {
    var infoDetail: InfoCardModel

    @State private var information: Information?

    @State private var imageRotateAnimation: Bool = false

    fileprivate func image(name: String) -> some View {
        return VStack {
            HStack {
                Spacer().padding()

                Image(systemName: name) // Pegar dos assets as outras imagens
                    .font(Font.system(size: 100))
                    .opacity(0.5)
                    .padding(.top, -80)
                    .padding(.trailing, -60)
                    .rotationEffect(imageRotateAnimation ? Angle(degrees: -45) : .zero)
                    .animation(.easeIn(duration: 1))
            }

            Spacer().padding()

        }.ignoresSafeArea()
    }

    fileprivate func textContent() -> some View {
        return
            VStack(alignment: .leading, spacing: 10) {
                // usar information nas views
                ForEach(information?.content ?? [], id: \.header) { content in

                    if content.header == "Fonte" {
                        Text("Fonte: \(content.text)").padding()
                    } else {
                        Text(content.header)
                            .padding()
                            .font(
                                Font.system(
                                    size: 24,
                                    weight: .medium,
                                    design: .rounded
                                )
                            )
                        Text(content.text).padding(.horizontal)
                    }

                    Spacer()
                }
            }
    }

    var body: some View {
        ScrollView {
            ZStack {
                image(name: "bitcoinsign.circle.fill")
                textContent()
            }
        }
        .navigationTitle(Text(infoDetail.title))
        .background(LinearGradient(gradient:
                                    Gradient(colors:
                                                [Color("backgroundStart"), Color("backgroundEnd")]
        ),
                             startPoint: .topLeading,
                             endPoint: .bottomTrailing).ignoresSafeArea())
        .onAppear(perform: {
            let fetchInfo = InformationService()
            let informationDataArray = fetchInfo.parseJson(filename: "Informacoes")

            // filtrar o informationArray e pegar só o da Tela que vc entrou (Criptomoeads, Blockchain, ...)
            let informationData = informationDataArray.first(where: { informationData in
                return informationData.topic == infoDetail.title
            })

            // atribuir o InformationData especifico a variavel information
            self.information = informationData

            imageRotateAnimation = true
        })
    }
}

struct InfoDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InfoDetail(infoDetail: InfoCardModel(
                title: "Criptomoedas", image: "bitcoinsign.circle.fill"
            ))
        }
            .previewDevice("iPhone SE (2nd generation)")
    }
}
