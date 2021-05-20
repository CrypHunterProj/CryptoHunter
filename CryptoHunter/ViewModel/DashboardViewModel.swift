//
//  DashboardViewModel.swift
//  CrypHunter (iOS)
//
//  Created by Albert on 11/05/21.
//

import Foundation
import WatchConnectivity

class DashboardViewModel: ObservableObject {

    var provider: WatchConnectionProvider

    init(provider: WatchConnectionProvider) {
        self.provider = provider
    }
}

extension DashboardViewModel {
    func sendFileToWatch() {
    }
}
