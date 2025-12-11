//
//  PickStudentView.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct PickStudentView: View {
    
    
    var body: some View {
        List {
            ForEach(cohorts.keys.sorted(), id: \.self) { cohortKey in
                if let users = cohorts[cohortKey] {
                    Section(header: Text(cohortKey).font(.headline)) {
                        ForEach(users, id: \.name) { user in
                            Text(user.name)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PickStudentView()
}
