//
//  EditView.swift
//  MCRI Monitoring App
//
//  Created by Prevail Mukunga on 11/12/2025.
//

import SwiftUI
struct PerformaceCriteria: Identifiable, Equatable, Hashable{
    let id = UUID()
    let activity: String
    var isDone: Bool = false
    
}
struct EditView: View {
    
    @State private var showingNotice: Bool = false
    @State private var newActivity: String = ""
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
        .alert("Enter activity", isPresented: $showingNotice) {
                   TextField("Activity", text: $newActivity)
                   Button("Cancel", role: .cancel) { newActivity = "" }
                   Button("Add") { submit() }
               } message: {
                   Text("Add a new activity to the list.")
               }
        .navigationTitle("Activities")
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                Button {
                    showingNotice = true
                } label: {
                    Image(systemName: "plus")
                }
            }
           
        }
        .onAppear {
            criteria = user.criteria
        }
    }
    
    private func submit() {
        let trimmed = newActivity.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        criteria.append(PerformaceCriteria(activity: trimmed))
        newActivity = ""
    }
}

#Preview {
    EditView(user: .constant(
        User(name: "Preview Student",
             password: "pass",
             emailAddress: "preview@example.com",
             type: .student)
    ))
}
