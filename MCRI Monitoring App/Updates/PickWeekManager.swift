//
//  PickWeekManager.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct PickWeekManager: View {
    var weeks = ["12/11/25", "18/11/25", "21/11/25", "27/11/25"]
    var body: some View {
        NavigationStack{
//            Text(" All Updates")
//                .font(.largeTitle)
//                .fontWeight(.bold)
            
            List(weeks, id: \.self) { week in
                NavigationLink(destination: PickStudentView()) {
                    HorizontalWeekView(week: week)
                }
            }
            .listStyle(.automatic)
                

            }
        .navigationTitle("All Updates")
    }
}

#Preview {
    PickWeekManager()
}
