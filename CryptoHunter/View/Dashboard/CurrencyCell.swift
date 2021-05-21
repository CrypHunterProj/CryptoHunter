//
//  CurrencyCell.swift
//  CryptoHunter
//
//  Created by Albert on 13/05/21.
//

import SwiftUI

struct CurrencyCell: View {
    @State var currency: Currency

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.sRGB, red: 4/255, green: 20/255, blue: 25/255, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 24)
                .padding(.vertical, 4)

            HStack {
                AsyncImage(url: URL(string: "https://cryptoicons.org/api/white/\(currency.id.lowercased())/200")!,
                           placeholder: { getCurrencyDefaultImage(named: currency.id.lowercased()) },
                           image: { Image(uiImage: $0).resizable() })
                        .frame(width: 36, height: 36)
                        .padding(.trailing, 8)
                VStack(alignment: .leading) {
                    Text(currency.id)
                        .font(.callout)
                        .bold()
                    Text(currency.name)
                        .font(.caption)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    Text("\(currency.value.currencyFormat)")
                        .font(.footnote)
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .allowsTightening(true)
                        .minimumScaleFactor(0.1)

                    HStack {
                        (currency.percentage > 0 ? Image("upArrow") : Image("downArrow"))
                            .resizable()
                            .frame(width: 8, height: 8)

                        Text("\(currency.percentage)%")
                            .font(.caption)
                    }
                }
            }
            .font(.body)
            .foregroundColor(.white)
            .padding(.horizontal, 42)
        }
    }

    func getCurrencyDefaultImage(named: String) -> Image {
        let uiImage =  (UIImage(named: named) ?? UIImage(named: "aeur"))!
        return Image(uiImage: uiImage)
    }
}

struct CurrencyCell_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyCell(currency: Currency(id: "", name: "", value: 220110.55398024683, image: "", percentage: 0))
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
