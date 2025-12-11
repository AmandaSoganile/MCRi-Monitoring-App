//
//  message.swift
//  MCRI Monitoring App
//
//  Created by Tana on 11/12/2025.
//
import SwiftUI

struct message: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("A simple way to record, monitor, and resolve matters for better organization and outcomes.")
                    .fontWeight(.heavy)
                Spacer()
                NavigationLink("Start"){LoginView()
                    
                }
                .padding()
                .foregroundStyle(.black)
                .fontWeight(.bold)
                .background(Capsule().fill(Color.blue))
            }
            }
        }
    }


#Preview {
    message()
}
