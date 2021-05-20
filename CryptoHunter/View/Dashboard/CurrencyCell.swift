//
//  CurrencyCell.swift
//  CryptoHunter
//
//  Created by Albert on 13/05/21.
//

import SwiftUI

struct CurrencyCell: View {
    var currency: Currency

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("background"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 24)
                .padding(.vertical, 4)

            HStack {
                AsyncImage(url: URL(string: "https://cryptoicons.org/api/white/eth/200")!,
                           placeholder: { ProgressView() },
                           image: { Image(uiImage: $0).resizable() })
                        .frame(width: 36, height: 36)
                        .padding(.trailing, 8)
                VStack(alignment: .leading) {
                    Text(currency.id)
                    Text(currency.name)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("R$\(currency.value)")
                    HStack {
//                        Image("upArrow")
                        Text("\(currency.percentage)%")
                    }
                }
            }
            .font(.body)
            .foregroundColor(.white)
            .padding(.horizontal, 42)
        }
    }
}

struct CurrencyCell_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyCell(currency: Currency(id: "", name: "", value: 2000, image: "", percentage: 0))
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
