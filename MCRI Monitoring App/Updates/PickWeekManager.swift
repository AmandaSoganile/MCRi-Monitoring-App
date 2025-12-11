//
//  PickWeekManager.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct PickWeekManager: View {
    var weeks = ["Week ending ..1", "Week ending ..2", "Week ending ..3", "Week ending ..4"]
    var body: some View {
        NavigationStack{
            Text("Pick your week")
                .font(.largeTitle)
                .fontWeight(.bold)
            
        }
    }
}

#Preview {
    PickWeekManager()
}
