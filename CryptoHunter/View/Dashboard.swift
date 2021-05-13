//
//  Dashboard.swift
//  CrypHunter (iOS)
//
//  Created by Albert on 11/05/21.
//

import UIKit
import SwiftUI

struct Dashboard: View {
    var body: some View {
        let viewModel = DashboardViewModel()
        let items = [Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                     Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),
                     Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                     Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),
                     Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                     Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),
                     Currency(id: "BTC", name: "Bitcoin", value: 2000.00, image: "", percentage: 14),
                     Currency(id: "ETH", name: "Etherium", value: 2400.00, image: "", percentage: 23),]
        
        NavigationView {
            VStack {
                DashboardHeader()
                    .zIndex(1)
                
                ZStack {
                    ScrollView {
                        RoundedRectangle(cornerRadius: 24)
                            .edgesIgnoringSafeArea(.all)
                        ForEach(items, id: \.self) { item in
                            NavigationLink(destination: CurrencyDetail(currency: item)) {
                                CurrencyCell(currency: item)
                                    .frame(height: 80)
                            }
                        }
                    }.zIndex(0)
                    
                    
                }
                
            }
            .navigationBarTitle("Dashboard", displayMode: .large)
            .navigationBarItems(trailing:
                                    Button("Edit") {
                                    }
            )
        }
    }
}

struct CurrencyDetail: View {
    var currency: Currency
    
    var body: some View {
        NavigationView {
            List {
                
            }
        }.navigationBarTitle(Text(currency.name), displayMode: .large)
    }
}

struct CurrencyCell: View {
    var currency: Currency
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 24)
                .padding(.vertical, 4)
                .shadow(color: Color.black, radius: 3, x: 3, y: 3)
            
            HStack {
                Image("")
                VStack(alignment: .leading) {
                    Text(currency.id)
                    Text(currency.name)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("R$\(currency.value)")
                    Text("\(currency.percentage)%")
                }
            }
            .font(.body)
            .foregroundColor(.white)
            .padding(.horizontal, 42)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
            .previewDevice("iPhone 11")
    }
}
