//
//  NotificationsView.swift
//  MCRI Monitoring App
//
//  Created by Naishe Rowland  on 12/11/25.
//
import SwiftUI

struct NotificationsView: View {
        @State private var pushNotifications = true
        @State private var emailNotifications = false
        @State private var smsNotifications = false
        @State private var weeklySummary = true
        
        // Do Not Disturb state
        @State private var dndEnabled = false
        @State private var dndStart = Date()
        @State private var dndEnd = Date().addingTimeInterval(3600) // 1 hour later

        var body: some View {
            Form {
                // MARK: Notification Preferences
                Section(header: Text("Notification Preferences")) {
                    Toggle(isOn: $pushNotifications) {
                        Label("Push Notifications", systemImage: "bell.fill")
                    }
                    
                    Toggle(isOn: $emailNotifications) {
                        Label("Email Notifications", systemImage: "envelope.fill")
                    }
                    
                    Toggle(isOn: $smsNotifications) {
                        Label("SMS Notifications", systemImage: "message.fill")
                    }
                    
                    Toggle(isOn: $weeklySummary) {
                        Label("Weekly Summary", systemImage: "calendar")
                    }
                }
                
                // MARK: Do Not Disturb
                Section(header: Text("Do Not Disturb")) {
                    Toggle("Enable Do Not Disturb", isOn: $dndEnabled)
                    
                    if dndEnabled {
                        DatePicker("Start Time", selection: $dndStart, displayedComponents: .hourAndMinute)
                        DatePicker("End Time", selection: $dndEnd, displayedComponents: .hourAndMinute)
                    }
                }
                
                // MARK: Advanced Settings
                Section(header: Text("Advanced Settings")) {
                    NavigationLink(destination: NotificationSoundView()) {
                        Text("Notification Sounds")
                    }
                    
                    NavigationLink(destination: NotificationTimeView()) {
                        Text("Notification Time")
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // Placeholder views for advanced settings
    struct NotificationSoundView: View {
        var body: some View {
            Text("Select your notification sound")
                .navigationTitle("Sounds")
        }
    }

    struct NotificationTimeView: View {
        var body: some View {
            Text("Set the time to receive notifications")
                .navigationTitle("Notification Time")
        }
    }

    // Preview
    #Preview {
        NavigationStack {
            NotificationsView()
        }
    }

#Preview {
    NotificationsView()
}
