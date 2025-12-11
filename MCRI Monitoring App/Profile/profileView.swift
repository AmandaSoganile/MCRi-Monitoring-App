//
//  profileView.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct profileView: View {
    @State private var name: String = "Amanda Soganile"
    @State private var email: String = "amanda@gmail.com"
    @State private var userType: String = "Standard User"
    @State private var bio: String = "This is a short info area."
    @State private var location: String = "Vic Falls, Zim"
    
    var body: some View {
        ScrollView {
                    VStack(spacing: 20) {
                        ZStack {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                        }
                        .padding(.top, 20)

                        VStack(alignment: .leading){
                            Text("Name:")
                            TextField("Name", text: $name)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                        

                        VStack(alignment: .leading){
                            Text("Email:")
                            TextField("Email", text: $email)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                        VStack(alignment: .leading){
                            Text("Role:")
                            Picker("User Type", selection: $userType) {
                                Text("Intern")
                                Text("Student")
                                Text("Facilitator")
                            }
                            .pickerStyle(.palette)
                            .padding(.vertical)
                        }
                        
                        VStack(alignment: .leading){
                            Text("More Info:")
                            TextField("Bio", text: $bio)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                            
                        }
                        
                        VStack(alignment: .leading){
                            Text("Location:")
                            TextField("Location", text: $location)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                       
                        Button(action: {
                            print("Profile saved")
                        }) {
                            Text("Save Changes")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(8)
                        }
                        .padding(.top, 20)
                    }
                    .padding()
                }
                .navigationBarTitle("Edit Profile", displayMode: .inline)
            }
}

#Preview {
    profileView()
}
