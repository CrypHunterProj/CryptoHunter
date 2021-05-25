//
//  ConnectionService.swift
//  CryptoHunter WatchKit Extension
//
//  Created by Fernando de Lucas da Silva Gomes on 19/05/21.
//

import WatchKit
import WatchConnectivity

class IphoneConnectionProvider: NSObject, WCSessionDelegate {

    private let session: WCSession

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

extension IphoneConnectionProvider {

    public var available: Bool {
       return self.session.isReachable
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }

    func sessionDidBecomeInactive(_ session: WCSession) {

    }

    func sessionDidDeactivate(_ session: WCSession) {

    }
}
