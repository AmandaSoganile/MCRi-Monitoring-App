//
//  message2.swift
//  MCRI Monitoring App
//
//  Created by Tana on 11/12/2025.
//
import SwiftUI

struct RegisterView: View {
   
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var loginMessage = ""
    @State private var loggedInUser: User?
    @State private var navigate = false   // Navigation trigger
    @State private var selectedUserType: UserType = .student
    
    var users: [User]   // Pass your users array here
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("Enter your details to proceed")
                    .font(.largeTitle)
                    .bold()
                
                Picker("Select User Type", selection: $selectedUserType) {
                    ForEach(UserType.allCases) { type in
                        Text(type.rawValue.capitalized).tag(type)
                    }
                }
                .pickerStyle(.menu)
                .padding()
                .background(Color.blue.opacity(0.15))
                .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Name")
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Email")
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Password")
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
               
                Button(action: {
                    registerUser()
                }) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                // Show welcome message after registration
                if let user = loggedInUser {
                    Text("Welcome, \(name)!")
                        .font(.headline)
                        .padding(.top, 10)
                }
                
                Spacer()
                
                // Hidden NavigationLink (activated by the register button)
                NavigationLink("", destination: Dashboard(), isActive: $navigate)
                    .hidden()
            }
            .padding()
        }
    }
    
    private func registerUser() {
        guard !email.isEmpty && !password.isEmpty else {
            loginMessage = "Please fill all fields."
            return
        }
        
        // Create new user
        let newUser = User(name: email, password: password, emailAddress: email, type: .student)
        loggedInUser = newUser
        loginMessage = "Registration successful!"
        
        // Navigate to LoginView after a short delay to show welcome message
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            navigate = true
        }
    }
}



#Preview{
    RegisterView(users: users)
}
