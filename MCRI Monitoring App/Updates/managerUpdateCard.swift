//
//  managerUpdateCard.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct managerUpdateCard: View {
    var user: User
    var report: ManagerWeeklyUpdate
    
    var body: some View {
        VStack{
            Text("Facilitators Report")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            HStack{
                Text("Week Ending: ")
                    .fontWeight(.bold)
                Spacer()
                Text(report.weekEnding, style: .date)
            }
            .padding()
            
            HStack{
                Text("Absent Students: ")
                    .fontWeight(.bold)
                Spacer()
                Text(report.absentee)
            }
            .padding()
            
            HStack{
                Text("Latecomers: ")
                    .fontWeight(.bold)
                Spacer()
                Text(report.latecomer)
            }
            .padding()
            
            HStack{
                Text("Students on Explorations:")
                    .fontWeight(.bold)
                Spacer()
                Text(String(report.studentsOnExplorations))
            }
            .padding()
            
            HStack{
                Text("Students on Fundamentals:")
                    .fontWeight(.bold)
                Spacer()
                Text(String(report.studentsOnFundamentals))
            }
            .padding()
            
            HStack{
                Text("BoldVoice Average Score:")
                    .fontWeight(.bold)
                Spacer()
                Text(report.boldVoiceScore)
            }
            .padding()
            
            HStack{
                Text("Student Achievements:")
                    .fontWeight(.bold)
                Spacer()
                Text(report.studentAchievements)
            }
            .padding()
            
            HStack{
                Text("Milestones Achieved:")
                    .fontWeight(.bold)
                Spacer()
                Text(report.milestonesCovered)
            }
            .padding()
            
            HStack{
                Text("Goals for upcoming week:")
                    .fontWeight(.bold)
                Spacer()
                Text(report.goalsForWeek)
            }
            .padding()
            
            HStack{
                Text("Upcoming Events:")
                    .fontWeight(.bold)
                Spacer()
                Text(report.upcomingEvents)
            }
            .padding()
        }
    }
}

#Preview {
    managerUpdateCard(user: User(name: "Amanda", password: "", emailAddress: "ama", type: .student), report: ManagerWeeklyUpdate(
        weekEnding: Date(),
        absentee: "Jessica",
        latecomer: "N/A",
        studentsOnExplorations: 2,
        studentsOnFundamentals: 10,
        boldVoiceScore: "89",
        studentAchievements: "Keisha passed exam",
        milestonesCovered: "Wall painted",
        goalsForWeek: "Fix door handles",
        upcomingEvents: "Dinner for facilitators"
    ))
}
