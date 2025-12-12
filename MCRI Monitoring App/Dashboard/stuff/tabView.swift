//
//  tabView.swift
//  MCRI Monitoring App
//
//  Created by Naishe Rowland  on 12/11/25.
//
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

           UpdatesPage()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Updates")
                }

            CreateReport()
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Create")
                }
            
            Chats()
                .tabItem {
                    Image(systemName: "ellipsis.message")
                   
                    Text("Goals")
                }
            
            Settings()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    MainTabView()
}

