//
//  EditGoalView.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 12/12/2025.
//

import SwiftUI

struct EditGoalView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var title: String
    @State private var details: String
    @State private var hasDueDate: Bool
    @State private var dueDate: Date
    @State private var priority: GoalPriority

    let original: Goal
    var onSave: (Goal) -> Void

    init(goal: Goal, onSave: @escaping (Goal) -> Void) {
        self.original = goal
        _title = State(initialValue: goal.title)
        _details = State(initialValue: goal.details)
        let hasDate = goal.dueDate != nil
        _hasDueDate = State(initialValue: hasDate)
        _dueDate = State(initialValue: goal.dueDate ?? Date())
        _priority = State(initialValue: goal.priority)
        self.onSave = onSave
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: $title)
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
            .navigationTitle("Edit Goal")
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
                        var updated = original
                        updated.title = trimmedTitle
                        updated.details = details
                        updated.dueDate = dateToSave
                        updated.priority = priority
                        onSave(updated)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}
