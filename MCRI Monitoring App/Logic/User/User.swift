//
//  User.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 11/12/2025.
//
import SwiftUI

struct User {
    var name: String
    var password: String
    var emailAddress: String
    var type: UserType
    
    init(name: String, password: String, emailAddress: String, type: UserType) {
        self.name = name
        self.password = password
        self.emailAddress = emailAddress
        self.type = type
    }
}

enum AccessLevel: String {
    case minimum, manager, outsider
}

enum UserType: String, CaseIterable, Identifiable {
    case student, intern, facilitator, manager, projectManager, donor, company
    
    var id: String { rawValue }
    
    var level: AccessLevel {
        switch self {
        case .student, .intern:
            return .minimum
        case .facilitator, .manager, .projectManager:
            return .manager
        case .donor, .company:
            return .outsider
        }
    }
}

var users: [User] = [
    User(name: "Student", password: "admin", emailAddress: "stud@example.com", type: .student),
    User(name: "Intern", password: "admin", emailAddress: "intern@example.com", type: .intern),
    User(name: "Facilitator", password: "admin", emailAddress: "facilitator@example.com", type: .facilitator),
    User(name: "company", password: "admin", emailAddress: "comp@example.com", type: .company),
    User(name: "Donor", password: "admin", emailAddress: "don@example.com", type: .donor),
]
struct LoginView: View {
    @State private var selectedUserType: UserType = .student
    @State private var email = ""
    @State private var password = ""
    @State private var loginMessage = ""
    @State private var loggedInUser: User?
    
    var body: some View {
       // NavigationStack{
        VStack(spacing: 20) {
            Spacer()
            Text("Matter App Login")
                .font(.largeTitle)
                .bold()
            
            Picker("Select User Type", selection: $selectedUserType) {
                ForEach(UserType.allCases) { type in
                    Text(type.rawValue.capitalized).tag(type)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                login()
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
    }
    
    //  Login Function
    func login() {
        // check if email exists in the array
        guard let matchedUser = users.first(where: { $0.emailAddress == email }) else {
            loginMessage = "Login failed. Email not found."
            loggedInUser = nil
            return
        }

        // Check if selected user type matches the actual type
        guard matchedUser.type == selectedUserType else {
            loginMessage = "Login failed. Selected user type does not match the email."
            loggedInUser = nil
            return
        }

        // Check password
        guard matchedUser.password == password else {
            loginMessage = "Login failed. Incorrect password."
            loggedInUser = nil
            return
        }

        // All checks passed
        loggedInUser = matchedUser
        loginMessage = ""
    }

}

#Preview{
    LoginView()
}
