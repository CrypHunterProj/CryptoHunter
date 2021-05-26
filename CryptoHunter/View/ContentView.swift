//
//  ContentView.swift
//  Shared
//
//  Created by Albert on 11/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 0

    let dashboardVM = DashboardViewModel(provider: WatchConnectionProvider())

    var body: some View {
        UITabBar.appearance().barTintColor = UIColor(named: "backgroundTabBar")
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "imageTabItemUnselected")

        return TabView(selection: $selection) {
            Dashboard(viewModel: dashboardVM)
                .tabItem {
                    selection == 0 ? Image("dashboardHighlighted").renderingMode(.original) : Image("dashboard").renderingMode(.original)

                    Text("Dashboard")

                }.tag(0)
            InformationView()
                .tabItem {
                    selection == 1 ? Image("informationHightlighted").renderingMode(.original) : Image("information").renderingMode(.original)

                    Text("Informations")
                }.tag(1)
        }.accentColor(Color("textTabItemSelected"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
