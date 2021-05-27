//
//  DashboardBuilder.swift
//  CryptoHunter WatchKit Extension
//
//  Created by Fernando de Lucas da Silva Gomes on 19/05/21.
//

import SwiftUI
import WatchConnectivity

class ViewModel: NSObject, ObservableObject, WCSessionDelegate {

    @Published var response: MessageHandle!
    @Published var state = State.start

    let session: WCSession

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        self.connect()
    }

    func connect() {
        guard WCSession.isSupported() else {
            return
        }
        self.session.activate()
    }

}

extension ViewModel {

    enum State {case start, loading, error, done}

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
//            self.state = .loading
            self.response = MessageHandle(message: message)
            self.state = .done
        }
    }
}
