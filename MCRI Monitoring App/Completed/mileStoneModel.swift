//
//  mileStoneModel.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 12/12/2025.
//

import Foundation

struct MileStone: Hashable{
    
    var name : String
    var completedOn: Date?
    var timeTaken: String?
    var details: String?
}


let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

var milestonesn: [MileStone] = [
    MileStone(name: "First Exam", completedOn: dateFormatter.date(from: "2023-05-12")!, timeTaken: "1 day", details: "Student wrote their first exam of the semester."),
    MileStone(name: "Building Completed", completedOn: dateFormatter.date(from: "2023-06-01")!, timeTaken: "3 months", details: "Construction of the new school building was completed."),
    MileStone(name: "Received Donations", completedOn: dateFormatter.date(from: "2023-06-15")!, timeTaken: "2 weeks", details: "Received generous donations from the community to support school development."),
    MileStone(name: "Two New Students", completedOn: dateFormatter.date(from: "2023-07-11")!, timeTaken: "1 day", details: "Two new students enrolled in the school for the new semester."),
    MileStone(name: "Field Trip", completedOn: dateFormatter.date(from: "2023-08-08")!, timeTaken: "1 day", details: "Students went on a field trip to the science museum."),
    MileStone(name: "Sports Day", completedOn: dateFormatter.date(from: "2023-08-14")!, timeTaken: "1 day", details: "Held the annual sports day with events and competitions."),
    MileStone(name: "Graduation Ceremony", completedOn: dateFormatter.date(from: "2023-09-05")!, timeTaken: "1 day", details: "Graduation ceremony held for the senior students."),
    MileStone(name: "First Online Class", completedOn: dateFormatter.date(from: "2023-09-18")!, timeTaken: "1 day", details: "Successfully conducted the first online class due to school closure."),
    MileStone(name: "School Reopening", completedOn: dateFormatter.date(from: "2023-10-02")!, timeTaken: "1 day", details: "The school reopened after the summer break."),
    MileStone(name: "New Teacher Hired", completedOn: dateFormatter.date(from: "2023-10-08")!, timeTaken: "2 weeks", details: "A new teacher was hired for the English department.")
]
