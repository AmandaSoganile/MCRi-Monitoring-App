//
//  newMilestone.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 12/12/2025.
//

import SwiftUI

struct newMilestone: View {
    
    @State private var nameOfMilestone = ""
    @State private var dateCompleted: Date = Date()
    @State private var timeTaken = ""
    @State private var details = ""
    
    var body: some View {
        Text("Create New Milestone")
            .font(.largeTitle)
            .fontWeight(.semibold)
        Form {
        
            VStack(alignment: .leading) {
                Text("MileStone Name :")
                    .padding()
                    .fontWeight(.bold)
                
                TextField("Name", text: $nameOfMilestone )
                    .textFieldStyle(.automatic)
                    .padding()
            }
            
            VStack(alignment: .leading) {
                Text("Completed On :")
                    .padding()
                    .fontWeight(.bold)
                
                DatePicker("Select a Date", selection: $dateCompleted, displayedComponents: .date )
                    .padding()
            }
            
            VStack(alignment: .leading) {
                Text("Time Taken:")
                    .padding()
                    .fontWeight(.bold)
                
                TextField("Time", text: $timeTaken )
                    .textFieldStyle(.automatic)
                    .padding()
            }
            
            VStack(alignment: .leading) {
                Text("Details:")
                    .padding()
                    .fontWeight(.bold)
                
                TextField("Notes", text: $details )
                    .textFieldStyle(.automatic)
                    .padding()
            }
        }
        .formStyle(.automatic)
        
        Button(action: {
                       let newMileStone = MileStone(name: nameOfMilestone, completedOn: dateCompleted, timeTaken: timeTaken, details: details)
                        milestonesn.append(newMileStone)
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
}

#Preview {
    newMilestone()
}
