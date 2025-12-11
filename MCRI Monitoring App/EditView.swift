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
    var userType: UserType
    var body: some View {
        NavigationStack{
            List{
                HStack{
                    Text("Activities")
                        .font(.headline)
                    Spacer()
                    Text("Completed")
                        .font(.headline)
                }
                
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
            Text("Save")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .frame(width: 150)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.blue)
                )
//                .navigationTitle(student.name)
        }
    }
}

#Preview {
    EditView(userType: .intern)
}
