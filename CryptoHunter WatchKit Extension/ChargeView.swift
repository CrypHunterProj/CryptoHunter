//
//  ChargeView.swift
//  CryptoHunter WatchKit Extension
//
//  Created by Fernando de Lucas da Silva Gomes on 26/05/21.
//

import SwiftUI

struct ChargeView: View {

    @State private var charge: Float = 0
    let timer = Timer.publish(every: 0.07, on: .main, in: .common).autoconnect()
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
        ProgressView(value: charge, total: 100) {
            Image("iconcharge")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25, alignment: .center)
                .foregroundColor(.green)

        }
        .progressViewStyle(CircularProgressViewStyle(tint: .green))
        .onReceive(timer) { _ in (charge == 100) ? (charge=0) : (charge += 5) }

        if self.viewModel.session.isReachable == false {
                Text("iPhone fora de alcance e/ou aplicativo fechado")
                    .font(.system(size: 10))
                    .truncationMode(.middle)
                    .multilineTextAlignment(.center)

            } else {
                switch self.viewModel.state {
                case .start:
                    ChargeLabel(label: "Carregando dados")
                case .loading:
                    ChargeLabel(label: "Dados recebidos")
                default:
                    Text("Error")
                }
            }
        }
    }
}

struct ChargeLabel: View {
    var label: String
    var body: some View {
        Text(label)
            .font(.system(size: 10))
            .bold()
            .truncationMode(.middle)
            .multilineTextAlignment(.center)
    }
}
