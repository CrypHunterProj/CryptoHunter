//
//  ServiceError.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 18/05/21.
//

import Foundation

enum CurrencyServiceError: Error {
    case dataIsNil
    case decodeError(errorDescription: String)

    var localizedDescription: String {
        switch self {
        case .dataIsNil:
            return "The Request returned nil"
        case .decodeError(errorDescription: let errorDescription):
            return "\(errorDescription)"
        }
    }
}
