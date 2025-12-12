//
//  message2.swift
//  MCRI Monitoring App
//
//  Created by Tana on 11/12/2025.
//
//import SwiftUI
//
//struct RegisterView: View {
//   
//    @State private var name = ""
//    @State private var email = ""
//    @State private var password = ""
//    @State private var loginMessage = ""
//    @State private var loggedInUser: User?
//    @State private var navigate = false   // Navigation trigger
//    @State private var selectedUserType: UserType = .student
//    
//    var users: [User]   // Pass your users array here
//    
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//                Spacer()
//                
//                Text("Enter your details to proceed")
//                    .font(.largeTitle)
//                    .bold()
//                
//                Picker("Select User Type", selection: $selectedUserType) {
//                    ForEach(UserType.allCases) { type in
//                        Text(type.rawValue.capitalized).tag(type)
//                    }
//                }
//                .pickerStyle(.menu)
//                .padding()
//                .background(Color.blue.opacity(0.15))
//                .cornerRadius(10)
//                
//                VStack(alignment: .leading, spacing: 20){
//                    Text("Name")
//                    TextField("Name", text: $name)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    
//                    Text("Email")
//                    TextField("Email", text: $email)
//                        .keyboardType(.emailAddress)
//                        .textInputAutocapitalization(.never)
//                        .autocorrectionDisabled(true)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    
//                    Text("Password")
//                    SecureField("Password", text: $password)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//               
//                Button(action: {
//                    registerUser()
//                }) {
//                    Text("Register")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                
//                // Show welcome message after registration
//                if let user = loggedInUser {
//                    Text("Welcome, \(name)!")
//                        .font(.headline)
//                        .padding(.top, 10)
//                }
//                
//                Spacer()
//                
//                // Hidden NavigationLink (activated by the register button)
//                NavigationLink("", destination: Dashboard(), isActive: $navigate)
//                    .hidden()
//            }
//            .padding()
//        }
//    }
//    
//    private func registerUser() {
//        guard !email.isEmpty && !password.isEmpty else {
//            loginMessage = "Please fill all fields."
//            return
//        }
//        
//        // Create new user
//        let newUser = User(name: email, password: password, emailAddress: email, type: .student)
//        loggedInUser = newUser
//        loginMessage = "Registration successful!"
//        
//        // Navigate to LoginView after a short delay to show welcome message
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            navigate = true
//        }
//    }
//}
//
//
//
//#Preview{
//    RegisterView(users: users)
//}

import SwiftUI

struct RegisterView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var loginMessage = ""
    @State private var loggedInUser: User?
    @State private var navigate = false
    @State private var selectedUserType: UserType = .student
    
    var users: [User]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(colors: [Color.white.opacity(0), Color.blue.opacity(0.01)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 07) {
                    
                    // LOGO
                    Image("matterpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200,height: 280)
                        .shadow(radius: 0)
                      
                    
                    Text("Register")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                       
                    
                    // FORM CARD
                    VStack(spacing: 18) {
                        
                        // User Type Picker
                        Picker("Select User Type", selection: $selectedUserType) {
                            ForEach(UserType.allCases) { type in
                                Text(type.rawValue.capitalized).tag(type)
                            }
                        }
                        .pickerStyle(.menu)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(12)
                        
                        // Name, Email, Password Fields
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Name").foregroundColor(.gray).fontWeight(.semibold)
                            TextField("Name", text: $name)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                            
                            Text("Email").foregroundColor(.gray).fontWeight(.semibold)
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                            
                            Text("Password").foregroundColor(.gray).fontWeight(.semibold)
                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                        }
                        
                        // Error / Success Message
                        if !loginMessage.isEmpty {
                            Text(loginMessage)
                                .foregroundColor(.red)
                                .font(.footnote)
                                .padding(.top, 5)
                        }
                        
                        // REGISTER BUTTON
                        Button(action: registerUser) {
                            Text("Register")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        .padding(.top, 10)
                        
                        // Welcome Message
                        if let user = loggedInUser {
                            Text("Welcome, \(user.name)!")
                                .font(.headline)
                                .padding(.top, 5)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(25)
                    .background(Color.white.opacity(0.15))
                    .cornerRadius(25)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Hidden NavigationLink
                    NavigationLink("", destination: Dashboard(), isActive: $navigate)
                        .hidden()
                }
                .padding(.vertical, 40)
            }
        }
    }
    
    private func registerUser() {
        guard !name.isEmpty && !email.isEmpty && !password.isEmpty else {
            loginMessage = "Please fill all fields."
            return
        }
        
        // Create new user
        let newUser = User(name: name, password: password, emailAddress: email, type: selectedUserType)
        loggedInUser = newUser
        loginMessage = "Registration successful!"
        
        // Navigate to Dashboard after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            navigate = true
        }
    }
}

#Preview{
    RegisterView(users: users)
}
