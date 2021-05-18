//
//  Currency.swift
//  CrypHunter (iOS)
//
//  Created by Albert on 11/05/21.
//

import Foundation

struct Currency: Codable, Hashable {
    let id: String
    let name: String
    let value: Double
    let image: String
    let percentage: Int
}
