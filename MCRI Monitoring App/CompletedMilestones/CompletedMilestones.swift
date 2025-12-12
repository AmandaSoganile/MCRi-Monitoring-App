//
//  completedMilestones.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 12/12/2025.
//

import SwiftUI

struct CompletedMilestones: View {

    var milestones: [MileStone] = milestonesn

    var body: some View {
        NavigationStack {
            VStack {
                    
                    Text("Milestones")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(milestones, id: \.self) { milestone in
                                mileStoneCard(milestone: milestone)
                            }
                        }
                        .padding()
                    }
                }
            
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink {
                        newMilestone()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 40))
                            .tint(.blue)
                            .shadow(radius: 10)
                    }
                }
            }
        }
    }
}

#Preview {
    CompletedMilestones(milestones: milestonesn)
}
