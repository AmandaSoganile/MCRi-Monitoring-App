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
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Image(systemName: "hand.thumbsup.circle")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        
                    Text("Support")
                        .font(.largeTitle)
                        .fontDesign(.serif)
                        .bold()
                }
               Text("We're here to help. If you have any feedback or need support!")
                    .font(.title)
                    .multilineTextAlignment(.center)

                    .fontWeight(.semibold)
                    .padding()
          
                Spacer()
                
                VStack(alignment: .leading, spacing: 8){
                    Text("📨 Contact support")
                        .font(.headline)
                    Text("Email us at team2@gmail.com")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                }
                .padding()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Suggest a Feature")
                        .font(.headline)
                    Text("Have an idea to make the app better!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        
                }
                .padding(8)
               
                Spacer()
               
            }
            Text("© 2025 Team 2. All rights reserved.")
                .font(.footnote)
            
        }
    }
}

#Preview {
    Support()
}
