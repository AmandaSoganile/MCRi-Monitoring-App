//
//  Settings page.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//

import SwiftUI
import Combine

class AppSettings: ObservableObject {
    @Published var isDarkModeEnabled: Bool = false
}

struct Settings_page: View {
    @State private var isEnabled: Bool = true
    @State private var isTapped: Bool = false
    @State private var isDarkModeEnabled: Bool = false
    @State private var name: String = ""
    @State private var shouldDelete: Bool = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        VStack {
            
            NavigationStack {
                Form {
                    HStack {
                        Image(systemName: "gearshape")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("Settings")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }
                    
                    Section("Profile") {
                        NavigationLink(destination:ProfileDetails()) {
                            HStack {
                                
                                Image(systemName: "person")
                                Text("Profile Details")
                            }
                        }
                    }
                    Section("Other Settings"){
                       
                        NavigationLink(destination: PasswordPage())  {
                            HStack {
                                Image(systemName: "lock.circle")
                                Text("Password")
                            }
                        }
                        NavigationLink(destination: Notifications()) {
                            HStack {
                                Image(systemName: "bell.circle")
                                Text("Notifications")
                            }
                        }
                        HStack {
                            Image(systemName: "moon.circle")
                            Toggle("Dark Mode", isOn: $isDarkModeEnabled)
                        }
                    }
                    Section("Help") {
                        NavigationLink(destination: AboutTheApp()) {
                            Text(" About The App")
                        }
                        
                        NavigationLink(destination: Support()) {
                            Text("Contact Support")
                        }
                        
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundStyle(.red)
                            Button("Delete My Account") {
                                shouldDelete.toggle()
                            }
                            .alert(isPresented: $shouldDelete) {
                                Alert(
                                    title: Text("Delete Account"),
                                    message: Text("Are you sure you want to delete your account?"),
                                    primaryButton: .destructive(Text("Delete")) {
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                            .foregroundStyle(.red)
                        }
                    }
                }
            }
        }
    }
   
}

#Preview {
    Settings_page()
}
