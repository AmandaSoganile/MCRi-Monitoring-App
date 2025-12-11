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
//    let student: User

    var body: some View {
        NavigationStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle("Amelia")
        }
    }
}

#Preview {
//    SeeOnlyView(student:  )
}
