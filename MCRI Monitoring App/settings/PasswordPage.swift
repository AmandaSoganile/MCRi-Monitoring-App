//
//  PasswordPage.swift
//  MCRI Monitoring App
//
//  Created by LUCILE G MUCHEMWA on 11/12/2025.
//

import SwiftUI

struct PasswordPage: View {
    @State private var password: String = ""
    @State private var securePassword: String = ""
    @State private var confirmPassword: String = ""
    var body: some View {
        Form {
            Section(header: Text("Change Password").font(.largeTitle.bold()).foregroundStyle(.blue)) {
                SecureField("Password", text: $password)
                    
                SecureField("New Password", text: $securePassword)
                    
                if !securePassword.isEmpty && password != securePassword {
                    SecureField("Confirm Password", text: $confirmPassword)
                }
            }
        }
    }
}

#Preview {
    PasswordPage()
}
