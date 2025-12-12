//
//  Support.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//

import SwiftUI

struct Support: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    Image(systemName: "hand.thumbsup.circle")
                        .font(.title)
                    Text("Customer Support")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                Text("We're here to help. If you have any issues, questions, or feedback, feel free to reach out using the options below.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .fontDesign(.serif)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
                // Contact Support
                VStack(alignment: .leading, spacing: 8) {
                    Text("📩 Contact Support")
                        .font(.headline)
                    Text("Email us at lucile@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                .padding()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Suggest a Feature")
                        .font(.headline)
                    Text("Have an idea to make the app better!!.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
               
                Spacer()
                Text("Thank you for helping improve the Matter experience.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.top, 10)
            }
            .padding()
        }
    }
}

#Preview {
    Support()
}
