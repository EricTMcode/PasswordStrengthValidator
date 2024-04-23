//
//  ContentView.swift
//  PasswordStrengthValidator
//
//  Created by Eric on 23/04/2024.
//

import SwiftUI

enum PasswordStrength: String {
    case weak = "Weak"
    case moderate = "Moderate"
    case strong = "Strong"
}

struct Password {
    var value: String
    
    func validate() -> PasswordStrength {
        let passwordLength = value.count
        
        switch passwordLength {
        case 0..<6:
            return .weak
        case 6..<10:
            return .moderate
        case 10...:
            return .strong
        default:
            return .weak
        }
    }
}

struct PasswordStrengthView: View {
    let passwordStrength: PasswordStrength
    
    var passwordStrengthColor: Color {
        switch passwordStrength {
        case .weak:
                .red
        case .moderate:
                .orange
        case .strong:
                .green
        }
    }
    
    var body: some View {
        Text(passwordStrength.rawValue)
            .padding(5)
            .background(passwordStrengthColor)
    }
}

struct ContentView: View {
    @State private var username: String = ""
    @State private var password = Password(value: "")
    
    private var passwordStrength: PasswordStrength {
        password.validate()
    }
    
    var body: some View {
        Form {
            TextField("User name", text: $username)
            SecureField("Password", text: $password.value)
            Button("Signup") {
                
            }
            
            PasswordStrengthView(passwordStrength: passwordStrength)
                .opacity(password.value.isEmpty ? 0 : 1.0)
        }
        .navigationTitle("Signup")
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
