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
    let users: [User]
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var navigateToDashboard = false
    @State private var navigateToRegister = false
    @State private var loggedInUser: User?
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("loggedInEmail") var loggedInEmail: String = ""
    @AppStorage("currentUserEmail") var currentUserEmail: String = ""

    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // HIDDEN NAVIGATION LINKS
                NavigationLink("", destination: Dashboard(), isActive: $navigateToDashboard)
                    .hidden()
                
                NavigationLink("", destination: RegisterView(users: users), isActive: $navigateToRegister)
                    .hidden()
                
                // LOGO
                Image("matter")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 130)
                    .padding(.top, 20)
                
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                
                // INPUT FIELDS
                VStack(alignment: .leading, spacing: 18) {
                    Text("Email")
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Password")
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.top, 20)
                
                // ERROR MESSAGE
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 5)
                }
                
                // LOGIN BUTTON
                Button("Login") {
                    loginButtonTapped()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.top, 10)
                
                Text("If you don't have an account, register")
                // REGISTER BUTTON
                Button("Register") {
                    navigateToRegister = true
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.black)
//                .background(Color.blue)
//                .foregroundColor(.blue)
//                .cornerRadius(12)
                
                Spacer()
            }
            .padding()
        }
    }
    
    
    // LOGIN LOGIC (EMAIL + PASSWORD ONLY)
    private func loginButtonTapped() {
        guard let user = users.first(where: { $0.emailAddress == email }) else {
            errorMessage = "Email not found."
            return
        }

        guard user.password == password else {
            errorMessage = "Incorrect password."
            return
        }

        // Save the logged in user email (default user)
        currentUserEmail = user.emailAddress

        isLoggedIn = true
        navigateToDashboard = true
    }

}

#Preview {
    LoginView(users: users)
}

