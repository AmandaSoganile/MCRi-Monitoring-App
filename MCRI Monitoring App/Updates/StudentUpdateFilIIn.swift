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
    @State private var chapter: Int = 0
    @State private var unit : Int = 0
    @State private var bVScore: String = ""
    @State private var studAchievement: String = ""
    @State private var blocker: String = ""
    @State private var selectedWeek: Date = Date()
    
    let chapters = [1, 2, 3, 4, 5, 6]
    let units = [1, 2, 3, 4, 5, 6, 7]
    
    
    
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
                    
                    HStack{
                        Text("Attendance")
                            .fontWeight(.bold)
                        Spacer ()
                        
                        TextField("", text: $attendance)
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
                    .fontWeight(.bold)
                    
                   
                        HStack{

                            Picker("Choose chapter", selection: $chapter) {
                                ForEach(chapters, id: \.self) { value in
                                    Text("\(value)").tag(value)
                                }
                            }
                            .fontWeight(.bold)
                  
                            
                        }
                    
                    HStack{
                        Picker("Choose unit", selection: $unit) {
                            ForEach(units, id: \.self) { value in
                                Text("\(value)").tag(value)
                            }
                        }
                        .fontWeight(.bold)

                        
                    }
                    
                }
                
                Section(header: Text("Bold Voice")) {
                    HStack{
                        Text("BoldVoice")
                            .fontWeight(.bold)
                        Spacer()
                        TextField("Enter score", text: $bVScore)
                            .frame(width: 20)
                        Text("%")
                        
                    }
                }
                
                Section(header: Text("Student Achievement")){
                    VStack(alignment: .leading){
                        Text("Student Achievement")
                            .fontWeight(.bold)
                        
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
                            .fontWeight(.bold)
                        
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
