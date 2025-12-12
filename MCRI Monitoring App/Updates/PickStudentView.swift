//
//  PickStudentView.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct PickStudentView: View {
    var update = StudentUpdate(
        user: User(name: "Amanda", password: "ama@123", emailAddress: "Ama@gmail.com", type: .student),
        weekEnding: Date.now,
        attendance: 10,
        bookProgress: bookProgress(book: "Fundamentals", chapter: 4, unit: 2),
        boldVoiceScore: 45,
        studentAchievement: "N/A",
        additionalHelp: "N/A"
    )

    @State private var selectedUser: User? = nil

    var body: some View {
        ZStack {
            List {
                ForEach(cohorts.keys.sorted(), id: \.self) { cohortKey in
                    if let users = cohorts[cohortKey] {
                        Section(header: Text(cohortKey).font(.headline)) {
                            ForEach(users, id: \.name) { user in
                                Text(user.name)
                                    .onTapGesture {
                                        selectedUser = user
                                    }
                            }
                        }
                    }
                }
            }
            .blur(radius: selectedUser != nil ? 10 : 0)

            
            if let user = selectedUser {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { selectedUser = nil }

                UpdateCard(user: user, update: update)
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .transition(.scale)
            }
        }
        .animation(.easeInOut, value: selectedUser)
    }
}


#Preview {
    PickStudentView()
}
