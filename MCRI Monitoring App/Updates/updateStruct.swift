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
