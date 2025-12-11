//
//  updateStruct.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import Foundation

struct bookProgress: Codable {
    var book: String
    var chapter: Int
    var unit: Int
    
    var description : String {
        return "\(book), Chapter: \(chapter), Unit: \(unit)"
    }
    
}

struct StudentUpdate{
    var user: User
    var weekEnding : Date
    var attendance: Int
    var bookProgress: bookProgress
    var boldVoiceScore: Int
    var studentAchievement: String
    var additionalHelp: String
}



struct ManagerWeeklyUpdate: Identifiable, Codable {
    let id = UUID()
    
    // Attendance
    var weekEnding: Date
    var absentee: String
    var latecomer: String
    
    // Book Progress
    var studentsOnExplorations: Int
    var studentsOnFundamentals: Int
    
    // BoldVoice
    var boldVoiceScore: String
    
    // Additional Information
    var studentAchievements: String
    var milestonesCovered: String
    var goalsForWeek: String
    
    // Events
    var upcomingEvents: String
}

var managerReports: [ManagerWeeklyUpdate] = []
var studentReports: [StudentUpdate] = []

