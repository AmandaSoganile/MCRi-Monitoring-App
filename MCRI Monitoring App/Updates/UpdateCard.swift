//
//  UpdateCard.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct UpdateCard: View {
    var user: User
    let update: StudentUpdate
    
    var body: some View {
        VStack{
            
            Text(user.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            HStack{
                Text("Week Ending: ")
                    .fontWeight(.bold)
                Spacer()
                Text(update.weekEnding, style: .date)
            }
            .padding()
            
            HStack{
                Text("Attendance: ")
                    .fontWeight(.bold)
                Spacer()
                Text(String(update.attendance))
            }
            .padding()
            
           
            
            HStack{
                Text("Book Progress:")
                    .fontWeight(.bold)
                Spacer()
                Text(update.bookProgress.description)
            }
            .padding()
            
            HStack{
                Text("BoldVoice Score:")
                    .fontWeight(.bold)
                Spacer()
                Text(String(update.boldVoiceScore))
            }
            .padding()
            
            HStack{
                Text("Student Achievement:")
                    .fontWeight(.bold)
                Spacer()
                Text(update.studentAchievement)
            }
            .padding()
            
            HStack{
                Text("Additional Help Needed:")
                    .fontWeight(.bold)
                Spacer()
                Text(update.additionalHelp)
            }
            .padding()
        }
    }
}

#Preview {
    UpdateCard(
        user: User(
            name: "Amanda",
            password: "",
            emailAddress: "ama",
            type: .student
        ),
        update: StudentUpdate(
            user: User(
                name: "Amanda",
                password: "",
                emailAddress: "ama",
                type: .student
            ),
            weekEnding: Date(),
            attendance: 17,
            bookProgress: bookProgress(book: "Swift Explorations", chapter: 3, unit: 2),
            boldVoiceScore: 89,
            studentAchievement: "Completed first exam with high marks.",
            additionalHelp: "Needs support with Unit 3 reading tasks."
        )
    )
}
