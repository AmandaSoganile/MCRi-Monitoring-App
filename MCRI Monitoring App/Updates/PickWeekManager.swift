//
//  PickWeekManager.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct PickWeekManager: View {
    var weeks = ["12/06/25", "22/06/25", "02/07/25", "13/07/25"]
    var body: some View {
        NavigationStack{
            Text(" All Updates")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            List(weeks, id: \.self) { week in
                NavigationLink(destination: PickStudentView()) {
                    HorizontalWeekView(week: week)
                }
            }
            .listStyle(.inset)
                

            }
        .navigationTitle("All Updates")
    }
}

#Preview {
    PickWeekManager()
}
