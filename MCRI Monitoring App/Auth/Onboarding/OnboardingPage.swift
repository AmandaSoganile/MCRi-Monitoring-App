//
//  OnboardingPage.swift
//  MCRI Monitoring App
//
//  Created by Ron Harifiyati on 12/12/2025.
//

import SwiftUI

struct OnboardingPage: View {
    let image: String
    let title: String
    let subtitle: String
    let gradient: [Color]
    let tag: Int
    
    var body: some View {
        ZStack {
            LinearGradient(colors: gradient,
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Spacer()
                
                if let uiImage = UIImage(named: image) {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 480, height: 290)
//                            .shadow(radius: 6)
                    } else {
                        Image(systemName: image)
                            .symbolRenderingMode(.hierarchical)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .foregroundStyle(.white.opacity(0.95))
                            .shadow(radius: 6)
                    }
                
                VStack(spacing: 12) {
                    Text(title)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blue)
                    
                    Text(subtitle)
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 20)
                }
                .padding(25)
                .background(.white)
                .cornerRadius(25)
                .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                .padding(.horizontal)
              
                
                Spacer()
            }
        }
        .tag(tag)
    }
}
