//
//  StudentUpdateFilIIn.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct StudentUpdateFilIIn: View {
    @State private var attendance: String = ""
    @State private var selectedBook = ""
    @State private var chapter: String = ""
    @State private var unit : String = ""
    @State private var bVScore: String = ""
    @State private var studAchievement: String = ""
    @State private var blocker: String = ""
    var books: [String] = ["Swift Explorations", "Swift Fundamentals"]
    
    var body: some View {
        NavigationStack{
            Text("Weekly Updates")
                .font(.largeTitle)
                .fontWeight(.bold)
            Form {
                Section(header: Text("Attendance")){
                    HStack{
                        Text("Attendance")
                        
                        Spacer ()
                        
                        TextField("Enter attendance days", text: $attendance)
                            .frame(width: 20)
                        
                        Text("/5")
                    }
                }
                
                Section(header: Text("Book Progress")){
                    
                    Picker("Books", selection: $selectedBook){
                        ForEach(books, id : \.self) { book in
                            Text(book)
                        }
                    }
                    
                    HStack {
                        Text("Chapter")
                        
                        Spacer()
                        
                        TextField("Chapter Number", text: $chapter)
                            .frame(width: 80)
                            .tint(.gray)
                    }
                    
                    HStack {
                        Text("Unit")
                        
                        Spacer()
                        
                        TextField("Unit Number", text: $unit)
                    }
                    
                }
                
                Section(header: Text("Bold Voice")) {
                    HStack{
                        Text("BoldVoice Score")
                        Spacer()
                        TextField("Enter score", text: $bVScore)
                            .frame(width: 20)
                        Text("%")
                        
                    }
                }
                
                Section(header: Text("Student Achievement")){
                    VStack(alignment: .leading){
                        Text("Student Achievement")
                        
                        TextEditor(text: $studAchievement)
                            .frame(minHeight: 100)
                            .foregroundColor(.primary)
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
                
                Section(header: Text("Blockers")){
                    VStack(alignment: .leading){
                        Text("Additional Help Needed")
                        
                        TextEditor(text: $studAchievement)
                            .frame(minHeight: 100)
                            .foregroundColor(.primary)
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
            }
            Button(action: {
                        print("Saved!")
                    }) {
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
    StudentUpdateFilIIn()
}
