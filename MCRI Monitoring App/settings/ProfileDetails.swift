//
//  ProfileDetails.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//

import SwiftUI

struct ProfileDetails: View {
    @State private var hasbeenTapped: Bool = false
    var body: some View {
        Form {
                Section("Profile"){
                    HStack{
                        Image(systemName: "person.circle")
                        Text("Luile")
                            .font(.title2)
                    }
                    Text("Access Level: Minimum")
                    
                }
            }
        }
    }


#Preview {
    ProfileDetails()
}
