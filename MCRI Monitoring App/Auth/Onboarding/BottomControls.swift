//
//  BottomControls.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 12/12/2025.
//

import SwiftUI

struct BottomControls: View {
    @Binding var page: Int
    
    var body: some View {
        HStack {
            if page < 3 {
                Button("Skip") {
                    page = 3
                }
                .foregroundColor(.white)
                .bold()
                .padding(.leading, 30)
                
                Spacer()
                
                Button("Next") {
                    withAnimation {
                        if page < 3 { page += 1 }
                    }
                }
                .foregroundColor(.blue)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(.white)
                .clipShape(Capsule())
                .shadow(radius: 4)
                .padding(.trailing, 30)
                
            } else {
                Button("Get Started") {
                    // Navigate to login
                }
                .foregroundColor(.blue)
                .padding(.vertical, 12)
                .padding(.horizontal, 40)
                .background(.white)
                .clipShape(Capsule())
                .shadow(radius: 5)
            }
        }
        .padding(.bottom, 35)
        .ignoresSafeArea()
    }
        
}


#Preview {
    BottomControls(page: .constant(1))
}
