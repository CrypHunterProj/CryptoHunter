//
//  ContentView.swift
//  Shared
//
//  Created by Albert on 11/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Dashboard()
                .tabItem {
                    Image("dashboard").renderingMode(.template)
                    Text("Dashboard")
                }
            InformationView()
                .tabItem {
                    Image("information").renderingMode(.template)
                    Text("Informations")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
