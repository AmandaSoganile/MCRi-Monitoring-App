//
//  requests.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let sender: UserType
    let receiver: UserType
    let title: String
    let description: String
}

struct Requests: View {
    @State private var titleOfIssue: String = ""
    @State private var descriptionOfIssue: String = ""
    @State private var submitted: Bool = false
    @State private var permissionDenied: Bool = false
    @AppStorage("currentUserRole") private var currentUserRole: String = UserType.student.rawValue
    
    @State private var receiver: UserType = .manager
    
    @State private var messages: [Message] = []

    static let permissions: [UserType: [UserType]] = [
        .student: [.facilitator, .intern],
        .intern: [.facilitator, .manager],
        .facilitator: [.manager, .company, .donor, .projectManager]
    ]

    var sender: UserType {
        UserType(rawValue: currentUserRole) ?? .student
    }

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Logged in: \(sender.rawValue.capitalized)")) {}
                
                Section(header: Text("Request Help").font(.largeTitle.bold())) {
                    TextField("Issue...", text: $titleOfIssue)
                }
                
                Section {
                    TextField("Description...", text: $descriptionOfIssue)
                }

                Button("Submit") {
                    sendMessage()
                }
                .disabled(!canSendMessage(from: sender, to: receiver)) // prevent button tap
                
            }
        }
        .alert("Submitted!", isPresented: $submitted) { }
        .alert("Permission Denied", isPresented: $permissionDenied) { }
    }
   

    func canSendMessage(from sender: UserType, to receiver: UserType) -> Bool {
        Requests.permissions[sender]?.contains(receiver) ?? false
    }

    func sendMessage() {
        if canSendMessage(from: sender, to: receiver) {
            let newMessage = Message(
                sender: sender,
                receiver: receiver,
                title: titleOfIssue,
                description: descriptionOfIssue
            )
            
            messages.append(newMessage)
            submitted = true
        } else {
            permissionDenied = true
        }
    }
}

#Preview {
    Requests()
}
