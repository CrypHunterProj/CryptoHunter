//
//  CryptoHunterApp.swift
//  CryptoHunter WatchKit Extension
//
//  Created by Albert on 12/05/21.
//

import SwiftUI

@main
struct CryptoHunterApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
