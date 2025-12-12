//
//  User.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 11/12/2025.
//
import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var name: String
    var password: String
    var emailAdress: String
    var type: UserType
    
    var criteria: [PerformaceCriteria] = []

    
  
    init(name: String, password: String, emailAdress: String, type: UserType) {
        self.name = name
        self.password = password
        self.emailAdress = emailAdress
        self.type = type
        self.criteria = getCriteria(criteria: type)
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



func getCriteria(criteria: UserType)-> [PerformaceCriteria]{
    switch criteria{
    case .student:
        return [
                       PerformaceCriteria(activity: "Getting things done Book", isDone: false),
                       PerformaceCriteria(activity: "Leadershift Book", isDone: false),
                       PerformaceCriteria(activity: "Swift Associate exam", isDone: false),
                       PerformaceCriteria(activity: "Swift Certified exam", isDone: false),
                       PerformaceCriteria(activity: "Personal project", isDone: false),
                       PerformaceCriteria(activity: "SDLC", isDone: false),
                       PerformaceCriteria(activity: "Hackathon", isDone: false),
                       PerformaceCriteria(activity: "Jamf 100", isDone: false),
                       PerformaceCriteria(activity: "Jamf 120", isDone: false),
                   ]
    case .intern:
        return [
                       PerformaceCriteria(activity: "Getting things done Book", isDone: false),
                       PerformaceCriteria(activity: "Leadershift Book", isDone: false),
                       PerformaceCriteria(activity: "Swift Associate exam", isDone: false),
                       PerformaceCriteria(activity: "Swift Certified exam", isDone: false),
                       PerformaceCriteria(activity: "Personal project", isDone: false),
                       PerformaceCriteria(activity: "SDLC", isDone: false),
                       PerformaceCriteria(activity: "Hackathon", isDone: false),
                       PerformaceCriteria(activity: "Jamf 100", isDone: false),
                       PerformaceCriteria(activity: "Jamf 120", isDone: false),
                   ]
    case .facilitator:
        return []
    case .manager:
        return []
    case .projectManager:
        return []
    case .donor:
        return []
    case .company:
        return []
    }
}

var users: [User] = [
    User(name: "Intern", password: "admin", emailAdress: "intern@example.com", type: .intern),
    User(name: "Facilitator", password: "admin", emailAdress: "facilitator@example.com", type: .facilitator),
    User(name: "Donor", password: "admin", emailAdress: "manager@example.com", type: .donor),
]
