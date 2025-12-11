//
//  EditView.swift
//  MCRI Monitoring App
//
//  Created by Prevail Mukunga on 11/12/2025.
//

import SwiftUI
struct PerformaceCriteria: Identifiable{
    let id = UUID()
    let activity: String
    var isDone: Bool = false
    
}
struct EditView: View {
    @State private var criteria: [PerformaceCriteria] = []
    @State  var savedActivities: [[PerformaceCriteria]] = [ ]
    var onSave: (([PerformaceCriteria]) -> Void)? = nil
   
    var userType: UserType
    var body: some View {
        NavigationStack{
            List{
               
            
                ForEach($criteria){$item in
                    HStack{
                        Text(item.activity)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: item.isDone ? "checkmark.square.fill" : "square")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                item.isDone.toggle()
                            }
                           

                        
                    }
                    
                }
            }
             .onAppear {
                if criteria.isEmpty {
                    criteria = getCriteria(criteria: userType)
                }
            }
            Button{
                guard !criteria.isEmpty else{return}
                onSave?(criteria)
                
            }label: {
                Text("Save")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.blue)
                    )
            }
            
            
            
                .navigationTitle("Activities")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
        }
    }
}

#Preview {
    EditView(userType: .intern)
}
