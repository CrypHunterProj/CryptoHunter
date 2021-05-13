//
//  InfoDetail.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 13/05/21.
//

import SwiftUI

struct InfoDetail: View {
    var infoDetail: InfoCardModel

    var body: some View {
        NavigationView {
            List {

            }
        }.navigationTitle(Text(infoDetail.title))
    }
}
