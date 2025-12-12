//
//  DashboardView.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 12/12/2025.
//

import SwiftUI

struct DashboardView: View {
    @State private var progress: Double = 0.8
    @AppStorage("userRole") var userRole: String = "facilitator"

    private let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    Color.blue
                        .ignoresSafeArea(.all)
                        .frame(height: 180)
                        .ignoresSafeArea()
                        .overlay(
                            HStack {
                                Text("Hello, Len !")
                                    .font(.largeTitle.bold())
                                    .foregroundColor(.white)
                                    .padding(.leading, 18)

                                Spacer()

                                NavigationLink(destination: NotificationsView()) {
                                    Image(systemName: "bell.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .background(Color.orange.opacity(0.25))
                                        .clipShape(Circle())
                                }
                                .padding(.trailing, 8)

                                NavigationLink(destination: ProfileView()) {
                                    Image(systemName: "gearshape.fill")
                                        .font(.system(size: 25))
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .background(Color.orange.opacity(0.25))
                                        .clipShape(Circle())
                                }
                                .padding(.trailing, 16)
                            }
                        )
                    Spacer()
                    ScrollView {
                        VStack(spacing: 25) {
                           
                            // MARK: - KPIs Section
                            if ["facilitator", "manager", "projectManager"].contains(userRole) {
                                VStack(alignment: .leading, spacing: 15) {
                                    Text("Key Performance Indicators")
                                        .font(.title2.bold())
                                    
                                    HStack(spacing: 20) {
                                        KPIItem(title: "Completed", value: "\(Int(progress * 100))%", icon: "checkmark.circle.fill", color: .green)
                                        KPIItem(title: "Pending", value: "12", icon: "clock.fill", color: .orange)
                                    }
                                    
                                    HStack(spacing: 20) {
                                        KPIItem(title: "Overdue", value: "3", icon: "exclamationmark.circle.fill", color: .red)
                                        KPIItem(title: "Total Reports", value: "50", icon: "doc.plaintext.fill", color: .blue)
                                    }
                                }
                                
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(20)
                                .shadow(radius: 2)
                                .padding(.horizontal)
                                
                            }
                            // MARK: - 4 Square Blocks
                            // FULL-WIDTH Students Performance block
                            ZStack(alignment: .top) {
                                
                                // Grey overlay (thin background behind all blocks)
                                Color(.secondarySystemBackground)
                                    .cornerRadius(20)
                                    .shadow(radius: 2)
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 540)
                                
                                VStack(spacing: 20) {
                                    NavigationLink(destination: StudentsPerfomance()) {
                                        DashboardBlock(title: "Students Performance",
                                                       icon: "chart.line.uptrend.xyaxis")
                                        .frame(maxWidth: 450)
                                        .padding(.horizontal)
                                        .background(Color(.secondarySystemBackground))
                                        .frame(height: 150)
                                    }
                                    .padding(.horizontal)
                                    LazyVGrid(columns: gridItems, spacing: 20) {
                                        if ["facilitator", "manager", "projectManager"].contains(userRole) {
                                            NavigationLink(destination: PickWeekManager()) {
                                                DashboardBlock(title: "Updates", icon: "chart.bar.doc.horizontal")
                                            }
                                        }
                                        if ["student", "intern", "facilitator"].contains(userRole) {
                                            NavigationLink(destination: HelpRequests()) {
                                                DashboardBlock(title: "Help Requests", icon: "person.fill.questionmark")
                                            }
                                        }
                                        NavigationLink(destination: GoalsView()) {
                                            DashboardBlock(title: "Goals", icon: "medal.fill")
                                        }
                                        NavigationLink(destination: CompletedMilestones()) {
                                            DashboardBlock(title: "CompletedMilestones", icon: "trophy.fill")
                                            
                                        }
                                        
                                    }
                                    
                                    
                                    .cornerRadius(25)
                                    .shadow(radius: 3)
                                    .padding(.horizontal)
                                    .padding(.horizontal)
                                }
                                .padding(.top)
                            }
                        }
                    }
                }
                // Floating action button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: CreateReport()) {
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                                .padding()
                        }
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .padding()
                    }
                }
            }
            .navigationTitle("")
            .ignoresSafeArea()
        }
    }
}

#Preview {
    DashboardView()
}
