//
//  availableReports.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 12/12/2025.
//

import SwiftUI

struct availableReports: View {
    var user: User
    var report: ManagerWeeklyUpdate
    
    var body: some View {
        NavigationStack{
            Text("Available Reports")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            NavigationLink{
                managerUpdateCard(user: user, report: report)
            } label: {
                VStack(spacing: 20){
                    Text("Report for week: \(Date(), style: .date)")
                        .font(.headline)
                    
                    Text("Submitted on \(Date(), style: .date)")
                        .font(.caption)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding([.horizontal, .top])
            }
            .buttonStyle(.plain)
            
            
        }
    }
}

#Preview {
    availableReports(user: User(name: "Ama", password: "Ama123", emailAddress: "ama@gmail", type: .student), report: ManagerWeeklyUpdate(weekEnding: Date(), absentee: "ama", latecomer: "n/a", studentsOnExplorations: 2, studentsOnFundamentals: 3, boldVoiceScore: String(67), studentAchievements: "n/a", milestonesCovered: "exam", goalsForWeek: "a few", upcomingEvents: "no events"))
}
