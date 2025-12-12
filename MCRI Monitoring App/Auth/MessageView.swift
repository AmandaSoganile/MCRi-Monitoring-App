//
//  message.swift
//  MCRI Monitoring App
//
//  Created by Tana on 11/12/2025.
//
import SwiftUI

struct MessageView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("A simple way to record, monitor, and resolve matters for better organization and outcomes.")
                    .font(.title2)
                    .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                NavigationLink("Continue"){LoginView()
                    
                }
                .padding()
                .frame(width: 300)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .background(Capsule().fill(Color.blue))
            }
            }
        }
    }


#Preview {
    MessageView()
}
