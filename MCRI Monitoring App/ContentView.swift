//
//  ContentView.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
////
//
//import SwiftUI
//
//struct Welcome: View {
//    
//
//    var body: some View {
//        NavigationStack{
//           
//                VStack{
//                    Spacer()
//                    Image("matter")
//                        .resizable()
//                        .scaledToFit()
//                        //.frame(width: 600, height: 600)
//                    Spacer()
//                    NavigationLink("Next"){message()
//                    }
//                    .padding()
//                    .frame(width: 200)
//                    .foregroundStyle(.white)
//                    .font(.title3.bold())
//                    .background(Capsule().fill(Color.blue))
//                    .cornerRadius(200)
//                    
//                    
//                }
//            
//        }
//    }
//}
//
//#Preview {
//    Welcome()
//}

import SwiftUI

struct Welcome: View {
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
struct OnboardingPage: View {
    let image: String
    let title: String
    let subtitle: String
    let gradient: [Color]
    let tag: Int
    
    var body: some View {
        ZStack {
            LinearGradient(colors: gradient,
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Spacer()
                
                if let uiImage = UIImage(named: image) {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 480, height: 290)
//                            .shadow(radius: 6)
                    } else {
                        Image(systemName: image)
                            .symbolRenderingMode(.hierarchical)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .foregroundStyle(.white.opacity(0.95))
                            .shadow(radius: 6)
                    }
                
                VStack(spacing: 12) {
                    Text(title)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blue)
                    
                    Text(subtitle)
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 20)
                }
                .padding(25)
                .background(.white)
                .cornerRadius(25)
                .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                .padding(.horizontal)
              
                
                Spacer()
            }
        }
        .tag(tag)
    }
}

struct BottomControls: View {
    @Binding var page: Int
    
    var body: some View {
        HStack {
            if page < 3 {
                Button("Skip") {
                    page = 3
                }
                .foregroundColor(.white)
                .bold()
                .padding(.leading, 30)
                
                Spacer()
                
                Button("Next") {
                    withAnimation {
                        if page < 3 { page += 1 }
                    }
                }
                .foregroundColor(.blue)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(.white)
                .clipShape(Capsule())
                .shadow(radius: 4)
                .padding(.trailing, 30)
                
            } else {
                Button("Get Started") {
                    // Navigate to login
                }
                .foregroundColor(.blue)
                .padding(.vertical, 12)
                .padding(.horizontal, 40)
                .background(.white)
                .clipShape(Capsule())
                .shadow(radius: 5)
            }
        }
        .padding(.bottom, 35)
        .ignoresSafeArea()
    }
        
}


#Preview {
   Welcome()
}
