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
            
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 24)
                .padding(.vertical, 4)
                .shadow(color: Color.black, radius: 3, x: 3, y: 3)
            
            HStack {
                Image("")
                VStack(alignment: .leading) {
                    Text(currency.id)
                    Text(currency.name)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("R$\(currency.value)")
                    Text("\(currency.percentage)%")
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
    }
}
