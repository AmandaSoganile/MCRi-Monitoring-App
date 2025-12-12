//
//  ContentView.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 12/12/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State private var page = 0
        
        var body: some View {
            NavigationStack {
                TabView(selection: $page) {
                    
                    // First page with asset image
                    OnboardingPage(
                        image: "matterpic",
                        title: "Welcome to Matter Report",
                        subtitle: "Where reporting becomes simple, smart, and stress-free.",
                        gradient: [Color.white.opacity(0.85), Color.cyan.opacity(0)],
                        tag: 0
                    )
                    
                    // Other onboarding pages
                    OnboardingPage(
                        image: "camera.viewfinder",
                        title: "Capture What Matters 📸",
                        subtitle: "Log incidents, notes, and updates with clean, guided forms.",
                        gradient: [Color.gray.opacity(0.5), Color.teal.opacity(0)],
                        tag: 1
                    )
                    
                    OnboardingPage(
                        image: "folder.badge.person.crop",
                        title: "Stay Organized 📘",
                        subtitle: "All your reports neatly stored, searchable, and ready when needed.",
                        gradient: [Color.indigo.opacity(0.2), Color.blue.opacity(0)],
                        tag: 2
                        
                    )
                    
                    OnboardingPage(
                        image: "bolt.circle",
                        title: "Work Smarter 🚀",
                        subtitle: "Instant exports, automated timelines, and powerful insights.",
                        gradient: [Color.blue.opacity(0.4), Color.white.opacity(0.5)],
                        tag: 3
                    )
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .ignoresSafeArea()
                .safeAreaInset(edge: .bottom) {
                    HStack {
                        Spacer()
                        
                        // Navigation to LoginView
                        if page == 3 {
                            NavigationLink(destination: LoginView(users: users)) {
                                Text("Get Started")
                                    .foregroundColor(.blue)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 40)
                                    .background(.white)
                                    .clipShape(Capsule())
                                    .shadow(radius: 5)
                                 
                            }
                        } else {
                            Button("Next") { page += 1 }
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 28)
                                .background(.blue)
                                .clipShape(Capsule())
                        }
                        
                        Spacer()
                    }
                    .padding(.bottom, 30)
                }
            }
        }
}

#Preview {
    WelcomeView()
}
