//
//  Chattingview.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//

import SwiftUI

struct RequestMessage {
    let sender: User
    let recipientType: User
    var message: String
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}


struct Chattingview: View {
    @State private var messages: [ChatMessage] = []
    @State private var message = ""
    @State private var recipient: String = ""
    @State private var hasSent: Bool = false
    var body: some View {
        VStack {
            Image(systemName: "person.spatialaudio.3d.fill")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundStyle(.cyan)
                .padding(20)
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(messages) { msg in
                            HStack {
                                if msg.isUser { Spacer() }
                                Text(msg.text)
                                    .padding(10)
                                    .background(msg.isUser ? Color.blue : Color.gray.opacity(0.3))
                                    .foregroundColor(msg.isUser ? .white : .black)
                                    .cornerRadius(12)
                                if !msg.isUser { Spacer() }
                            }
                            .id(msg.id)
                        }
                    }
                    .padding()
                }
                .onChange(of: messages.count) { oldValue, newValue in
                    withAnimation {
                        if let lastID = messages.last?.id {
                            proxy.scrollTo(lastID, anchor: .bottom)
                        }
                    }
                }
            }
            
            HStack {
                TextField("Type a message...", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 20))
                }
                .disabled(message.isEmpty)
                .padding(.leading, 5)
            }
            .padding()
        }
    }
    func sendMessage() {
        let trimmed = message.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        messages.append(ChatMessage(text: trimmed, isUser: true))
        
//        supposed recipient message
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            messages.append(ChatMessage(text: "the recipient is the one answering \(trimmed)", isUser: false))
        }
        
        message = ""
    }
}



#Preview {
    Chattingview()
}

