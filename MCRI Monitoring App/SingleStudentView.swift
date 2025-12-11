//
//  SingleStudentView.swift
//  MCRI Monitoring App
//
//  Created by Prevail Mukunga on 11/12/2025.
//

import SwiftUI

struct SingleStudentView: View {
//    @State var  student: User.
   
    var body: some View {
        TabView{
            SeeOnlyView()
                .tabItem{
                    Text("View")
                }
            
            EditView(userType: .intern)
                .tabItem{
                    Text("Edit")
                        .font(.system(size: 20, weight: .bold))
                        
                }
            
        }
       
    }
}

#Preview {
    SingleStudentView()
}
