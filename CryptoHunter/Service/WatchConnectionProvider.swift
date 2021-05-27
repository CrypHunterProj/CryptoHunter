//
//  WatchConnectionProvider.swift
//  CryptoHunter
//
//  Created by Fernando de Lucas da Silva Gomes on 20/05/21.
//

import Foundation
import WatchConnectivity

class WatchConnectionProvider: NSObject, WCSessionDelegate {

    private let session: WCSession

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        self.connect()
    }

    func send(message: [String: Any]) {
        session.sendMessage(message, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }

    func connect() {
        guard WCSession.isSupported() else {
            return
        }
        self.session.activate()
    }

}

extension WatchConnectionProvider {

    public var available: Bool {
       return self.session.isReachable
    }

    public var paired: Bool {
        return self.session.isPaired
    }

    public var watchInstalled: Bool {
        return self.session.isWatchAppInstalled
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }

    func sessionDidBecomeInactive(_ session: WCSession) {

    }

    func sessionDidDeactivate(_ session: WCSession) {

    }
}
