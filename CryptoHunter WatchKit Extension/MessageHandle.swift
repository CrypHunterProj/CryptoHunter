//
//  ConnectionService.swift
//  CryptoHunter WatchKit Extension
//
//  Created by Fernando de Lucas da Silva Gomes on 19/05/21.
//
//
 import WatchKit
 import SwiftUI
 import WatchConnectivity

class MessageHandle {
    var siglas: [String]
    var percent: [Int]
    var data: [Double]
    var value: [Double]

    init(message: [String: Any]) {
        self.siglas = message["Siglas"] as? [String] ?? []
        self.percent = message["Percent"] as? [Int] ?? []
        self.data = message["Data"] as? [Double] ?? []
        self.value = message["Value"] as? [Double] ?? []
    }
}
