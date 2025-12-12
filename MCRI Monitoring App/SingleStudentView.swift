//
//  SingleStudentView.swift
//  MCRI Monitoring App
//
//  Created by Prevail Mukunga on 11/12/2025.
//

import SwiftUI

struct SingleStudentView: View {
    @State var student: User
    

    var body: some View {
        NavigationStack{
            if AccessLevel.manager == .manager {
                List {
                    NavigationLink("Edit Activities") {
                        EditView(user: $student)
                    }
                    
                    NavigationLink("See Only") {
                        SeeOnlyView(student: student)
                    }
                }
                .navigationTitle(student.name)
            }else if AccessLevel.outsider == .outsider {
                List {
                    NavigationLink("See Only") {
                        SeeOnlyView(student: student)
                    }
                }
                .navigationTitle(student.name)
            }
            
        }
    }
}

#Preview {
    SingleStudentView(
        student: User(
            name: "Preview Student",
            password: "pass",
            emailAdress: "test@example.com",
            type: .student
        )
    )
}

