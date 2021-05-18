//
//  InformationCards.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 13/05/21.
//

import SwiftUI

struct InfoCardModel: Codable, Hashable {
    let image: String
    let title: String

    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}
