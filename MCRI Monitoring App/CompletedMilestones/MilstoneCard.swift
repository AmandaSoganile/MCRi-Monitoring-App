//
//  mileStoneCard.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 12/12/2025.
//

import SwiftUI

struct mileStoneCard: View {
    var milestone: MileStone
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(milestone.name)
                .font(.headline)
            
            Text("Completed on: \(milestone.completedOn ?? Date(), style: .date)")
                .font(.subheadline)
            
            Text("Time taken: \(milestone.timeTaken ?? "1 Week+")")
                .font(.subheadline)

            Divider()

            Text(milestone.details ?? "N/A")
                .font(.subheadline)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
        )
        .shadow(radius: 5)
        .padding(.horizontal)
    }
//        .overlay(
//            RoundedRectangle(cornerRadius: 12)
//                .stroke(Color.gray, lineWidth: 1)
//        )
//        .padding([.horizontal, .top])
    }


#Preview {
    mileStoneCard(milestone: MileStone(name: "New Car", completedOn: Date(), timeTaken: "2 weeks", details: "New car donated by parents"))
}
