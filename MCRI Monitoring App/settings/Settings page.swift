//
//  Settings page.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//

import SwiftUI

struct Settings_page: View {
    @State private var isEnabled: Bool = true
    @State private var isTapped: Bool = false
    @State private var name: String = ""
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = "Are you want to Delete your Account?"
    @State private var alertMessage: String = ""
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
                            Toggle("Dark Mode", isOn: $isEnabled)
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
                            Text("Delete My Account")
                        }
                        .foregroundStyle(.red)
                    }
                }
            }
        }
    }
    func attemptDeletingAccount() {
        
    }
}

#Preview {
    Settings_page()
}
