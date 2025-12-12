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

    @State private var showMismatchError: Bool = false
    @State private var showSuccessAlert: Bool = false

    var body: some View {
        
        VStack {
            Text("Change Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.blue)
            Spacer()
               
            SecureField("Current Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
            
                    SecureField("New Password", text: $securePassword)
                .textFieldStyle(.roundedBorder)
                .padding()
                  Spacer()
                    
                    if !securePassword.isEmpty && securePassword != password {
                        SecureField("Confirm New Password", text: $confirmPassword)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                              Spacer()
                        
                        if !confirmPassword.isEmpty && confirmPassword != securePassword {
                            Text("Passwords do not match")
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }
                    Button("Change Password") {
                        changePassword()
                    }
                    .buttonStyle(.glassProminent)
                    
                    .disabled(!canChangePassword)
                    .padding()
                }
               
        .alert("Password Changed Successfully!", isPresented: $showSuccessAlert) {
            Button("OK") { }
        }
        .padding()
    }
    
    var canChangePassword: Bool {
        // Current password and new password are non-empty
        // Confirm password matches new password
        !password.isEmpty
        && !securePassword.isEmpty
        && confirmPassword == securePassword
    }
    
    func changePassword() {
        // Example validation:
        if canChangePassword {
            showMismatchError = false
            showSuccessAlert = true
            
            // Reset fields after success
            password = ""
            securePassword = ""
            confirmPassword = ""
        } else {
            showMismatchError = true
        }
    }
}

#Preview {
    PasswordPage()
}
