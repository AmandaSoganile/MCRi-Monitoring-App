//
//  PickStudentView.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct PickStudentView: View {
    @State private var selectedUser : User? = nil
    
    var body: some View {
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
                    .blur(radius: selectedUser != nil ? 10 : 0)
                    
                    if let user = selectedUser {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                            .transition(.opacity)
                        updateCard(user: user)
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                            .padding()
                            .shadow(radius: 10)
                            .onTapGesture {
                                selectedUser = nil
                            }
                    }
                }
            }
        }
        .animation(.easeInOut, value: selectedUser)
    }
}

#Preview {
    PickStudentView()
}
