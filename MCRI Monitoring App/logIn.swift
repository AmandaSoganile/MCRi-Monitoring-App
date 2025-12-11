//
//  message2.swift
//  MCRI Monitoring App
//
//  Created by Tana on 11/12/2025.
//
import SwiftUI


struct LoginView: View {
   
    @State private var email = ""
    @State private var password = ""
    @State private var loginMessage = ""
    @State private var loggedInUser: User?
    
    
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Spacer()
                Text("Enter your details to proceed")
                    .font(.largeTitle)
                    .bold()
                
               
               
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    //login()
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                if !loginMessage.isEmpty {
                    Text(loginMessage)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                
                // Display info when logged in
                if let user = loggedInUser {
                    VStack(spacing: 10) {
                        Text("Welcome, \(user.name)!")
                            .font(.headline)
                        
                    }
                    .padding(.top, 20)
                }
                
                Spacer()
            }
            .padding()
            NavigationLink("Next"){message()}
                .padding()
                .frame(width: 200)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .background(Capsule().fill(Color.blue))
                .cornerRadius(200)
                
        }
    }
    
}

#Preview{
    LoginView()
}
