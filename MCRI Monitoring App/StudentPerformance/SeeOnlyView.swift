//
//  SeeOnlyView.swift
//  MCRI Monitoring App
//
//  Created by Prevail Mukunga on 11/12/2025.
//

import SwiftUI
import Charts

//struct PerformaceCriteria: Identifiable{
//    let id = UUID()
//    let activity: String
//    var isDone: Bool = false
//    
//}

struct StatusCount: Identifiable {
    let id = UUID()
    let status: String
    let count: Int
}

struct SeeOnlyView: View {
    var student: User

    var body: some View {
        List(student.criteria) { item in
            HStack {
                Text(item.activity)
                Spacer()
                Image(systemName: item.isDone ? "checkmark.square.fill" : "square")
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle(student.name)
    }
}

#Preview {
    SeeOnlyView(student: User(
        name: "Preview Student",
        password: "pass",
        emailAddress: "preview@example.com",
        type: .student
    ))
}

