//
//  NumberFormater.swift
//  CryptoHunter
//
//  Created by Alley Pereira on 19/05/21.
//

import Foundation

extension NumberFormatter {
    convenience init(style: Style) {
        self.init()
        self.numberStyle = style
    }
}
extension Formatter {
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        return formatter
    }()
}
extension FloatingPoint {
    var currencyFormat: String {
        return Formatter.currencyFormatter.string(for: self) ?? ""
    }
}
