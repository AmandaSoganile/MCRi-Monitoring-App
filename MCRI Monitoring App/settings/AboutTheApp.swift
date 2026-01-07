//
//  AboutTheApp.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//

import SwiftUI

struct AboutTheApp: View {
    var body: some View {
        VStack {
            Text("About The App")
                .font(.largeTitle)
                .fontWeight(.bold)
//                .fontDesign(.serif)
                .padding()
                .foregroundStyle(.blue)
            
            
            
            Text("This app gives all Matters Stakeholders a simple, unified space tp share  and view structured  updates. It replaces scattered email threads with clear, organized insights into progress, blocker, milestones, and KPIs helping everyone stay aligned and informed.")
                .multilineTextAlignment(.center)
                .padding()
//                .fontDesign(.serif)
                .fontWeight(.semibold)
                
        }
    }
}

#Preview {
    AboutTheApp()
}
