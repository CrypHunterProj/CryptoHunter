//
//  InfoCard.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 13/05/21.
//

import SwiftUI

struct InfoCardView: View {

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
        InformationView()
    }
}
