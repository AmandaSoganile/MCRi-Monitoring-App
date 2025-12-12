//
//  ConversationsListView.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//




import SwiftUI

struct Conversation: Identifiable, Hashable {
    let id: UUID
    let title: String
    let lastMessage: String

    init(id: UUID = UUID(), title: String, lastMessage: String) {
        self.id = id
        self.title = title
        self.lastMessage = lastMessage
    }
}

struct ConversationsListView: View {
    @State private var conversations: [Conversation] = [
        Conversation(title: "Interns", lastMessage: "See you soon!"),
        Conversation(title: "Facilitator", lastMessage: "Can you send the report?"),
        Conversation(title: "Managers", lastMessage: "How can we help?"),
        Conversation(title: "Team", lastMessage: "Standup in 5 minutes."),
    ]

    var body: some View {
        NavigationStack {
            List(conversations) { convo in
                NavigationLink(value: convo) {
                    HStack(spacing: 12) {
                        Circle()
                            .fill(.cyan)
                            .frame(width: 36, height: 36)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .foregroundStyle(.white)
                            )
                        VStack(alignment: .leading, spacing: 4) {
                            Text(convo.title)
                                .font(.headline)
                            Text(convo.lastMessage)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Help and Requests")
            .navigationDestination(for: Conversation.self) { _ in
                Chattingview()
            }
        }
    }
}



#Preview {
    ConversationsListView()
}
