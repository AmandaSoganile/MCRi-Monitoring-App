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
    
    init(name: String, password: String, emailAdress: String, ) {
        self.name = name
        self.password = password
        self.emailAdress = emailAdress
        self.type = .student
    }
}

enum AccessLevel {
    case minimum, manager, outsider
}

enum UserType {
    case student, intern, facilitator, manager, projectManager, donors, company
    
    var level: AccessLevel {
        switch self {
        case .student, .intern:
            return .minimum
        case .facilitator, .manager, .projectManager:
            return .manager
        case .donors, .company:
            return .outsider
        }
    }
}


