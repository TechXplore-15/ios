//
//  ContentView.swift
//  TBCMobileBankFeatures
//
//  Created by Data on 21.02.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TransfersView()
                .tabItem {
                    Label("მთავარი", systemImage: "house")
                }
            SubscriptionList()
                .tabItem {
                    Label("გამოწერლი", systemImage: "list.bullet")
                }
        }
        .accentColor(Color("mainColor"))
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = .tabBarBack
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

#Preview {
    ContentView()
}
