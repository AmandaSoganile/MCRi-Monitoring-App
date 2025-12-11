//
//  HorizontalWeekView.swift
//  MCRI Monitoring App
//
//  Created by Amanda Soganile on 11/12/2025.
//

import SwiftUI

struct HorizontalWeekView: View {
    var week : String = "21/02/05"
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 170)
                .foregroundStyle(Color.white)
            
            Text("Week ending: \(week)")
                .font(.title2)
        }
    }
}

#Preview {
    HorizontalWeekView()
}
