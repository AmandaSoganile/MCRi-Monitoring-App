//
//  DashboardBlock.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 12/12/2025.
//

import SwiftUI

struct DashboardBlock: View {
    let title: String
    let icon: String

    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 35))
                .padding()
                .background(Color.gray.opacity(0.30))
                .clipShape(Circle())

            Text(title)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .frame(height: 140)
        .background(Color(.white))
        .cornerRadius(20)
        .shadow(radius: 3)
        
    }
}
