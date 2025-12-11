//
//  requests.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//

import SwiftUI

enum Urgency{
    case low, medium, high
    
}

struct requests: View {
    @State private var titleOfIssue: String = ""
    @State private var descriptionOfIssue: String = ""
    @State private var submitted: Bool = false
  
    var body: some View {
        
        VStack{
            
            Form {
                
                Section(header: Text("Request  Help").font(.largeTitle.bold())){
                    TextField("Issue...",text: $titleOfIssue)
                        .font(.title2)
                }
            
                Section(){
                    TextField("Description...",text: $descriptionOfIssue)
                        
                }
                Button("Submit"){
                    submitted.toggle()
                }
                .alert(isPresented: $submitted){
                    Alert(title: Text("Thank you for your help!"))
                }
            }
        }
    }
}

#Preview {
    requests()
}
