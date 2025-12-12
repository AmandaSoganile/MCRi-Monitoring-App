//
//  StudentPerfrmanceView.swift
//  MCRI Monitoring App
//
//  Created by Prevail Mukunga on 11/12/2025.
//

import SwiftUI



struct StudentPerfrmanceView: View {
    let cohortName: String
    let students: [User]
    
    var body: some View {
        List(students, id: \.self) { student in
            NavigationLink(student.name) {
                SingleStudentView(student: student)
            }
        }
        .navigationTitle(cohortName)
    }
}

#Preview {
    StudentPerfrmanceView(
        cohortName: "Cohort 1",
        students: cohorts["Cohort 1"] ?? []
    )
}

