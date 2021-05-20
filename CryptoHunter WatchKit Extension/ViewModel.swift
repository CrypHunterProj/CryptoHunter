//
//  DashboardBuilder.swift
//  CryptoHunter WatchKit Extension
//
//  Created by Fernando de Lucas da Silva Gomes on 19/05/21.
//

import SwiftUI
import WatchConnectivity

class ViewModel: ObservableObject {

    var connectionProvider: IphoneConnectionProvider

    @Published var message = ""

    init(_ iPhoneConnectionProvider: IphoneConnectionProvider) {
        self.connectionProvider = iPhoneConnectionProvider
    }
}

extension ViewModel {

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            self.message = message["message"] as? String ?? "Unknown"
        }
    }

    func session(_ session: WCSession, didReceiveMessageData messageData: Data, replyHandler: @escaping (Data) -> Void) {
        DispatchQueue.main.async {

        }
    }

}
