//
//  User.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 11/12/2025.
//

struct User {
    var name: String
    var password: String
    var emailAdress: String
    var type: UserType
    
    init(name: String, password: String, emailAdress: String, type: UserType) {
        self.name = name
        self.password = password
        self.emailAdress = emailAdress
        self.type = type
    }
}

enum AccessLevel {
    case minimum, manager, outsider
}

enum UserType {
    case student, intern, facilitator, manager, projectManager, donor, company
    
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
    User(name: "Intern", password: "admin", emailAdress: "intern@example.com", type: .intern),
    User(name: "Facilitator", password: "admin", emailAdress: "facilitator@example.com", type: .facilitator),
    User(name: "Donor", password: "admin", emailAdress: "manager@example.com", type: .donor),
]
