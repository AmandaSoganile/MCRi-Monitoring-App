//
//  managerUpdates.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct managerUpdates: View {
    
    @State private var attendance: String = ""
    @State private var absentee: String = ""
    @State private var latecomer: String = ""
    @State private var studentsonExplo = 0
    @State private var studentsonFund = 0
    @State private var studAchievement: String = ""
    @State private var topicsCovered: String = ""
    @State private var goalsforWeek: String = ""
    @State private var upcomingDates: String = ""
    @State private var chapter: Int = 0
    @State private var unit : Int = 0
    @State private var bVScore: String = ""
    
    @State private var selectedWeek: Date = Date()
    
    let chapters = [1, 2, 3, 4, 5, 6]
    let units = [1, 2, 3, 4, 5, 6, 7]
    let students = [1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
    
    var books: [String] = ["Swift Explorations", "Swift Fundamentals"]
    
    var body: some View {
        NavigationStack{
            Text("Weekly Updates")
                .font(.largeTitle)
                .fontWeight(.bold)
            Form {
                Section(header: Text("Attendance")){
                    HStack {
                        Text("Week Ending")
                            .fontWeight(.bold)
                        Spacer()
                        DatePicker("Select date", selection: $selectedWeek, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                            .padding(.leading, 10)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Absent Students")
                            .fontWeight(.bold)
                        
                        TextEditor(text: $absentee)
                            .frame(minHeight: 50)
                            .foregroundColor(.primary)
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Latecomers")
                            .fontWeight(.bold)
                        
                        TextEditor(text: $latecomer)
                            .frame(minHeight: 50)
                            .foregroundColor(.primary)
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
                
                Section(header: Text("Book Progress")){
                    HStack{
                        
                        Picker("Students on Explorations", selection: $studentsonExplo) {
                            ForEach(students, id: \.self) { value in
                                Text("\(value)").tag(value)
                            }
                        }
                        .fontWeight(.bold)
                    }
                    
                    HStack{
                        
                        Picker("Students on Fundamentals", selection: $studentsonFund) {
                            ForEach(students, id: \.self) { value in
                                Text("\(value)").tag(value)
                            }
                        }
                        .fontWeight(.bold)
                    }
                    
                    
                    
                }
                
                Section(header: Text("Bold Voice")) {
                    HStack{
                        Text("BoldVoice Average")
                            .fontWeight(.bold)
                        Spacer()
                        TextField("Enter score", text: $bVScore)
                            .frame(width: 20)
                        Text("%")
                        
                    }
                }
                
                Section(header: Text("Additional Information")){
                    VStack(alignment: .leading){
                        Text("Student Achievements")
                            .fontWeight(.bold)
                        
                        TextEditor(text: $studAchievement)
                            .frame(minHeight: 100)
                            .foregroundColor(.primary)
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Milestones Achieved This Week")
                            .fontWeight(.bold)
                        
                        TextEditor(text: $topicsCovered)
                            .frame(minHeight: 100)
                            .foregroundColor(.primary)
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Goals for upcoming week")
                            .fontWeight(.bold)
                        
                        TextEditor(text: $goalsforWeek)
                            .frame(minHeight: 100)
                            .foregroundColor(.primary)
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
                
                Section(header: Text("Dates to note")){
                    VStack(alignment: .leading){
                        Text("Upcoming Events(Title)")
                            .fontWeight(.bold)
                        
                        TextEditor(text: $upcomingDates)
                            .frame(minHeight: 100)
                            .foregroundColor(.primary)
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
            }
            Button(action: {
                let report = ManagerWeeklyUpdate(
                    weekEnding: selectedWeek,
                    absentee: absentee,
                    latecomer: latecomer,
                    studentsOnExplorations: studentsonExplo,
                    studentsOnFundamentals: studentsonFund,
                    boldVoiceScore: bVScore,
                    studentAchievements: studAchievement,
                    milestonesCovered: topicsCovered,
                    goalsForWeek: goalsforWeek,
                    upcomingEvents: upcomingDates
                )
                managerReports.append(report)
            })
            {
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 360, height: 70)
                        .foregroundStyle(Color.black)
                    
                    Text("Save")
                        .font(.title2)
                        .fontDesign(.default)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                }
            }
            
            
        }
        .navigationTitle("Weekly Updates")
    }
}

#Preview {
    managerUpdates()
}
