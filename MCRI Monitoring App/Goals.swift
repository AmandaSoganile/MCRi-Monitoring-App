//
//
import SwiftUI
import Combine

enum GoalPriority: String, Codable, CaseIterable, Identifiable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    var id: String { rawValue }
}

struct Goal: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var details: String
    var dueDate: Date?
    var priority: GoalPriority

    init(
        id: UUID = UUID(),
        title: String,
        details: String = "",
        dueDate: Date? = nil,
        priority: GoalPriority = .medium
    ) {
        self.id = id
        self.title = title
        self.details = details
        self.dueDate = dueDate
        self.priority = priority
    }
}

struct GoalsView: View {

    // persistent storage (AppStorage stores Data)
    @AppStorage("savedGoals") private var savedGoalsData: Data = Data()

    @State private var goals: [Goal] = []
    @State private var showingCreateGoal = false
    @State private var editingGoal: Goal? = nil

    var body: some View {
        ZStack {
            if goals.isEmpty {
                VStack(spacing: 8) {
                    Text("No goals yet")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    Text("Tap the + button to create your first goal.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .multilineTextAlignment(.center)
                .padding()
            } else {
                List {
                    ForEach(goals) { goal in
                        Button {
                            editingGoal = goal
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(goal.title)
                                        .font(.headline)

                                    Spacer()

                                    Text(goal.priority.rawValue)
                                        .font(.caption2)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(priorityColor(goal.priority).opacity(0.15))
                                        .foregroundColor(priorityColor(goal.priority))
                                        .cornerRadius(8)
                                }

                                if let due = goal.dueDate {
                                    Text("Due: \(formattedDate(due))")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }

                                if !goal.details.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                    Text(goal.details)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .lineLimit(2)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .onDelete { indexSet in
                        goals.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.insetGrouped)
            }

            // Floating +
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showingCreateGoal = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Goals")

        // load once on appear
        .onAppear { loadGoalsIfNeeded() }

        // save automatically when goals array changes
        .onChange(of: goals) { _ in saveGoals() }

        // create sheet
        .sheet(isPresented: $showingCreateGoal) {
            CreateGoalView { title, details, dueDate, priority in
                let newGoal = Goal(title: title, details: details, dueDate: dueDate, priority: priority)
                goals.append(newGoal)
            }
        }

        // edit sheet using item: so we avoid multiple simultaneous sheets
        .sheet(item: $editingGoal) { goalToEdit in
            EditGoalView(goal: goalToEdit) { updated in
                if let index = goals.firstIndex(where: { $0.id == updated.id }) {
                    goals[index] = updated
                }
            }
        }
    }

    // MARK: - Persistence helpers

    private func saveGoals() {
        if let encoded = try? JSONEncoder().encode(goals) {
            savedGoalsData = encoded
        }
    }

    private func loadGoalsIfNeeded() {
        // load only if we haven't already loaded (safe for repeated appearances)
        guard goals.isEmpty else { return }
        if let decoded = try? JSONDecoder().decode([Goal].self, from: savedGoalsData) {
            goals = decoded
        }
    }

    // MARK: - utils

    private func priorityColor(_ priority: GoalPriority) -> Color {
        switch priority {
        case .low: return .green
        case .medium: return .orange
        case .high: return .red
        }
    }

    private func formattedDate(_ date: Date) -> String {
        // safe, lightweight date formatting compatible with older iOS as well
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

// MARK: - Create & Edit Views (unchanged but adapted to item-sheet usage)

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

// Preview
#Preview {
    NavigationView {
        GoalsView()
    }
}
