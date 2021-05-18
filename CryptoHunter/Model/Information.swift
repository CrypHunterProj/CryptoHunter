//
//  InformationData.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 14/05/21.
//

import Foundation

struct Information: Codable {
    let topic: String
    let content: [Content]
}

struct Content: Codable {
    let header: String
    let text: String
}
