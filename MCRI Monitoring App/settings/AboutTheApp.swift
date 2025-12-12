//
//  AboutTheApp.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//

import SwiftUI

struct AboutTheApp: View {
    var body: some View {
        VStack{
            Text("About The App")
                .font(.largeTitle)
                .fontDesign(.serif)
                .fontWeight(.bold)
                .padding()
            
            Text("This app gives all Matter stakeholders a simple, unified space to share and view structured updates. It replaces scattered email threads with clear, organized insights into progress, blockers, milestones, and KPIs helping everyone stay aligned and informed")
                .multilineTextAlignment(.center)
                .padding()
                .fontDesign(.serif)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    AboutTheApp()
}
