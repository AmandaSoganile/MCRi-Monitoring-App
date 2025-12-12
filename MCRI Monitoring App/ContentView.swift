//
//  ContentView.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("matter")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 600)
                Spacer()
                NavigationLink("Next"){message()
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
    Welcome()
}
