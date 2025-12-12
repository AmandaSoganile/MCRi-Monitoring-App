//
//  CohortCategorieView.swift
//  MCRI Monitoring App
//
//  Created by Prevail Mukunga on 11/12/2025.
//

import SwiftUI

struct CohortCategorieView: View {
    var body: some View {
        NavigationStack{
            List{
                ForEach(cohorts.keys.sorted(), id: \.self){ cohort in
                    NavigationLink(cohort){
                        StudentPerfrmanceView(cohortName: cohort , students: cohorts[cohort] ?? [])
                    }
                    
                }
            }
            .navigationTitle("Cohorts")
        }
    }
}

#Preview {
    CohortCategorieView()
}
