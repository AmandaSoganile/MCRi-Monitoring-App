//
//  ContentView.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 12/12/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("matter")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 600)
                Spacer()
                NavigationLink("Next"){MessageView()
                }
                .padding()
                .frame(width: 200)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .background(Capsule().fill(Color.blue))
                .cornerRadius(200)
                
                
            }
        }
    }
}

#Preview {
    WelcomeView()
}
