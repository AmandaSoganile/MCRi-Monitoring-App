//
//  LoginView.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 12/12/2025.
//

import SwiftUI

struct LoginView: View {
    let users: [User]
    
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var navigateToDashboard = false
    @State private var navigateToRegister = false
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("currentUserEmail") var currentUserEmail: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(colors: [Color.white.opacity(0), Color.blue.opacity(0.0)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    // LOGO
                    Image("matterpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250,height: 190)
                        .shadow(radius: 0)
                    
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
//                        .padding(.top)
                    
                    // FORM CARD
                    VStack(spacing: 18) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                                .foregroundColor(.gray)
                                .fontWeight(.semibold)
                            
                            TextField("Enter your email", text: $email)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Password")
                                .foregroundColor(.gray)
                                .fontWeight(.semibold)
                            
                            SecureField("Enter your password", text: $password)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                        }
                        
                        if !errorMessage.isEmpty {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.footnote)
                                .padding(.top, 5)
                        }
                        
                        Button(action: loginButtonTapped) {
                            Text("Login")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        .padding(.top, 10)
                    }
                    .padding(25)
                    .background(Color.white.opacity(0.15))
                    .cornerRadius(25)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                    .padding(.horizontal)
                    
                    // Divider & Register
                    HStack {
                        Rectangle()
                            .fill(Color.black.opacity(0.5))
                            .frame(height: 1)
                        Text("or")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        Rectangle()
                            .fill(Color.black.opacity(0.5))
                            .frame(height: 1)
                    }
                    .padding(.horizontal)
                    
                    Button(action: { navigateToRegister = true }) {
                        Text("Register")
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    
                    // Hidden Navigation Links
                    NavigationLink("", destination: DashboardView(), isActive: $navigateToDashboard)
                        .hidden()
                    
                    NavigationLink("", destination: RegisterView(users: users), isActive: $navigateToRegister)
                        .hidden()
                    
//                    Spacer()
                }
                .padding(.vertical, 40)
            }
        }
    }
    
    // LOGIN LOGIC
    private func loginButtonTapped() {
        guard let user = users.first(where: { $0.emailAddress == email }) else {
            errorMessage = "Email not found."
            return
        }
        
        guard user.password == password else {
            errorMessage = "Incorrect password."
            return
        }
        
        currentUserEmail = user.emailAddress
        isLoggedIn = true
        navigateToDashboard = true
    }
}

#Preview {
    LoginView(users: users)
}
