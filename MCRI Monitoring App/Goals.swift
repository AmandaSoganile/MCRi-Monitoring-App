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

final class GoalsStore: ObservableObject {
    @Published var goals: [Goal] = [] {
        didSet { saveGoals() }
    }

    private let saveURL: URL = {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return dir.appendingPathComponent("goals.json")
    }()

    init() {
        loadGoals()
    }

    func addGoal(
        title: String,
        details: String,
        dueDate: Date?,
        priority: GoalPriority
    ) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }

        let newGoal = Goal(
            title: trimmedTitle,
            details: details,
            dueDate: dueDate,
            priority: priority
        )
        goals.append(newGoal)
    }

    func deleteGoal(at offsets: IndexSet) {
        goals.remove(atOffsets: offsets)
    }

    private func loadGoals() {
        do {
            let data = try Data(contentsOf: saveURL)
            let decoded = try JSONDecoder().decode([Goal].self, from: data)
            self.goals = decoded
        } catch {
            // First run or failed to decode; start empty
            self.goals = []
        }
    }

    private func saveGoals() {
        do {
            let data = try JSONEncoder().encode(goals)
            try data.write(to: saveURL, options: [.atomic])
        } catch {
            // You might want to log errors in development
        }
    }

    func updateGoal(_ goal: Goal) {
        if let idx = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[idx] = goal
        }
    }
}




struct GoalsView: View {
    @StateObject private var store = GoalsStore()
    @State private var showingCreateGoal = false
    @State private var editingGoal: Goal? = nil
    @State private var showingEditGoal = false

    var body: some View {
        ZStack {
            if store.goals.isEmpty {
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
                    ForEach(store.goals) { goal in
                        Button {
                            editingGoal = goal
                            showingEditGoal = true
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
                                    Text("Due: \(due.formatted(date: .abbreviated, time: .omitted))")
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
                    .onDelete(perform: store.deleteGoal)
                }
                .listStyle(InsetGroupedListStyle())
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
        .sheet(isPresented: $showingCreateGoal) {
            CreateGoalView { title, details, dueDate, priority in
                store.addGoal(
                    title: title,
                    details: details,
                    dueDate: dueDate,
                    priority: priority
                )
            }
        }
        .sheet(isPresented: $showingEditGoal) {
            if let goal = editingGoal {
                EditGoalView(goal: goal) { updated in
                    store.updateGoal(updated)
                }
            }
        }
    }

    private func priorityColor(_ priority: GoalPriority) -> Color {
        switch priority {
        case .low: return .green
        case .medium: return .orange
        case .high: return .red
        }
    }
}

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
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2))
                        )
                        .padding(.vertical, 4)
                }

                Section(header: Text("Due Date")) {
                    Toggle("Set due date", isOn: $hasDueDate.animation())

                    if hasDueDate {
                        DatePicker(
                            "Due",
                            selection: $dueDate,
                            displayedComponents: .date
                        )
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
                    Button("Cancel") {
                        dismiss()
                    }
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
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2))
                        )
                        .padding(.vertical, 4)
                }

                Section(header: Text("Due Date")) {
                    Toggle("Set due date", isOn: $hasDueDate.animation())

                    if hasDueDate {
                        DatePicker(
                            "Due",
                            selection: $dueDate,
                            displayedComponents: .date
                        )
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

#Preview {
    GoalsView()
}

