//
//  LoginView.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 12/12/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var selectedUserType: UserType = .student
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // Hidden NavigationLink
                NavigationLink("", destination: RegisterView(users: []), isActive: $navigate)
                    .hidden()
                Spacer()
                Image("matter")
                    .resizable()
                
                Text("Log in to continue")
                    .foregroundColor(.gray)
                
                // User type dropdown
                Picker("Select User Type", selection: $selectedUserType) {
                    ForEach(UserType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized).tag(type)
                    }
                }
                .pickerStyle(.menu)
                .padding()
                .background(Color.blue.opacity(0.15))
                .cornerRadius(10)
                
                Text("Name")
                    .font(.headline)
                
                
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                Text("Email")
                    .font(.headline)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Password")
                    .font(.headline)
                // Password
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                // Error
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                // Sign In Button
                Button(action: signIn) {
                    Text("Log In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(formIsValid ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                Button(action: signIn) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(formIsValid ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .disabled(!formIsValid)
                
                Spacer()
            }
            .padding()
            
        }
    }
    
    // FORM VALIDATION
    var formIsValid: Bool {
        // Find user that matches email + selected role
        guard let user = users.first(where: {
            $0.emailAddress == email && $0.type == selectedUserType
        }) else {
            return false
        }
        
        // Password must be AT LEAST the required length
        return password.count >= user.password.count
    }
    
    
    
    // SIGN IN
    func signIn() {
        // Look for user with matching email & type
        guard let user = users.first(where: {
            $0.emailAddress == email && $0.type == selectedUserType
        }) else {
            errorMessage = "Email does not match selected user type."
            return
        }
        
        // Check password
        guard user.password == password else {
            errorMessage = "Incorrect password."
            return
        }
        
        errorMessage = ""
        navigate = true
    }
}

#Preview {
    LoginView()
}

