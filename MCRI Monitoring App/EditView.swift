//
//  EditView.swift
//  MCRI Monitoring App
//
//  Created by Prevail Mukunga on 11/12/2025.
//

import SwiftUI
struct PerformaceCriteria: Identifiable{
    let id = UUID()
    let activity: String
    var isDone: Bool = false
    
}
struct EditView: View {
    @Binding var user: User
    @State private var criteria: [PerformaceCriteria] = []

    var body: some View {
        VStack {
            List {
                ForEach($criteria) { $item in
                    HStack {
                        Text(item.activity)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: item.isDone ? "checkmark.square.fill" : "square")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                item.isDone.toggle()
                            }
                    }
                }
            }
            
            Button("Save") {
                user.criteria = criteria
            }
            .font(.headline)
            .foregroundStyle(.white)
            .frame(width: 200, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
            )
            .padding(.bottom)
        }
        .navigationTitle("Activities")
        .onAppear {
            criteria = user.criteria
        }
    }
}

#Preview {
    EditView(user: .constant(
        User(name: "Preview Student",
             password: "pass",
             emailAdress: "preview@example.com",
             type: .student)
    ))
}

