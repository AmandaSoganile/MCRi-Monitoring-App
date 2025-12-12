//
//  CreateGoalView.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 12/12/2025.
//

import SwiftUI

struct CreateGoalView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var details: String = ""
    @State private var hasDueDate: Bool = false
    @State private var dueDate: Date = Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()
    @State private var priority: GoalPriority = .medium

    var onSave: (String, String, Date?, GoalPriority) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("e.g. Finish SwiftUI project", text: $title)
                        .textInputAutocapitalization(.sentences)
                }

                Section(header: Text("Details / Notes")) {
                    TextEditor(text: $details)
                        .frame(minHeight: 120)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.2)))
                        .padding(.vertical, 4)
                }

                Section(header: Text("Due Date")) {
                    Toggle("Set due date", isOn: $hasDueDate.animation())
                    if hasDueDate {
                        DatePicker("Due", selection: $dueDate, displayedComponents: .date)
                    }
                }

                Section(header: Text("Priority")) {
                    Picker("Priority", selection: $priority) {
                        ForEach(GoalPriority.allCases) { p in
                            Text(p.rawValue).tag(p)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("New Goal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !trimmedTitle.isEmpty else { return }
                        let dateToSave = hasDueDate ? dueDate : nil
                        onSave(trimmedTitle, details, dateToSave, priority)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}
