//
//  User.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 11/12/2025.
//
import SwiftUI

struct User: Equatable, Hashable{
    var name: String
    var password: String
    var emailAddress: String
    var type: UserType
    var criteria: [PerformaceCriteria] = []
    
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

