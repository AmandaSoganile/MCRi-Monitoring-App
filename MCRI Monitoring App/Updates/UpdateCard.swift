//
//  UpdateCard.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct UpdateCard: View {
    var user: User
//    var update: StudentUpdate
    
    var body: some View {
        VStack{
            Text(user.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            HStack{
                Text("Attendance: ")
                    .fontWeight(.bold)
                Spacer()
                Text("5 days")
            }
            .padding()
            
            HStack{
                Text("Book Progress:")
                    .fontWeight(.bold)
                Spacer()
                Text("Swift Fundamentals - Ch.2- Unit 3")
            }
            .padding()
            
            HStack{
                Text("BoldVoice Score:")
                    .fontWeight(.bold)
                Spacer()
                Text("89%")
            }
            .padding()
            
            HStack{
                Text("Student Achievement:")
                    .fontWeight(.bold)
                Spacer()
                Text("Passed first exam")
            }
            .padding()
            
            HStack{
                Text("Additional Help Needed:")
                    .fontWeight(.bold)
                Spacer()
                Text("LinkedIn Account requires renewing")
            }
            .padding()
        }
    }
}

#Preview {
    UpdateCard(user: User(name: "Amanda", password: "", emailAdress: "ama", type: .student),
//    update: StudentUpdate(user: User(name: "Amanda", password: "", emailAdress: "ama", type: .student), weekEnding: Date(), attendance: 4, bookProgress: bookProgress(book: "Swift", chapter: 1, unit: 1), boldVoiceScore: 23, studentAchievement: "", additionalHelp: "")
    )
}
