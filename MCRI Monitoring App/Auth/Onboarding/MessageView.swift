//
//  message.swift
//  MCRI Monitoring App
//
//  Created by Tana on 11/12/2025.
//
import SwiftUI

struct MessageView: View {
    var body: some View {
            NavigationStack {
                
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        // App Title / Logo Section
                        VStack(spacing: 10) {
                            Text("Matter")
                                .font(.system(size: 42, weight: .bold))
                                .foregroundColor(.blue)
                            
                            Text("Better Organization. Better Outcomes.")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 40)
                        
                        // Description Text
                        Text("A simple way to record, monitor, and resolve matters for better organization and outcomes.")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding(.horizontal, 25)
                            .multilineTextAlignment(.center)
                        
                        // Spacer()
                        
                        // Continue Button
                        NavigationLink(destination: LoginView()) {
                            Text("Continue")
                                .font(.title3.bold())
                                .frame(width: 300, height: 55)
                                .foregroundColor(.white)
                                .background(
                                    Capsule()
                                        .fill(Color.blue)
                                )
                        }
                        .shadow(radius: 5)
                        
                        Spacer()
                    }
                    .padding()
                }
               
        }

    }


#Preview {
    MessageView()
}
