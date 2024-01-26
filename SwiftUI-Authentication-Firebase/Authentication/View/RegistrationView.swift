//
//  RegistrationView.swift
//  SwiftUI-Authentication-Firebase
//
//  Created by ReetDhillon on 2024-01-26.
//

import SwiftUI

struct RegistrationView: View {
    @State private var emailTxt = ""
    @State private var fullNameTxt = ""
    @State private var passwordTxt = ""
    @State private var confirmPasswordTxt = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModelObj: AuthViewModel

    
    var body: some View {
        VStack{
            //Image
            Image("HarvardUniversity")
                .resizable()
                .scaledToFill()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120)
                .padding(.vertical, 32)
            
            //Form Fields
            VStack(spacing: 25){
                TextInputView(textStr: $emailTxt, titleStr: "Email Address", placeholderStr: "name@example.com")
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                TextInputView(textStr: $fullNameTxt, titleStr: "Full Name", placeholderStr: "Jon Snow")
                    .autocapitalization(.none)
                
                TextInputView(textStr: $passwordTxt, titleStr: "Password", placeholderStr: "Enter your password", isSecureField: true)
                
                ZStack(alignment: .trailing) {
                    TextInputView(textStr: $confirmPasswordTxt, titleStr: "Confirm Password", placeholderStr: "Confirm your password", isSecureField: true)
                    
                    if(!passwordTxt.isEmpty && !confirmPasswordTxt.isEmpty)
                    {
                        if(passwordTxt == confirmPasswordTxt)
                        {
                           Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                 .imageScale(.large)
                                 .fontWeight(.bold)
                                 .foregroundColor(Color(.systemRed))
                        }
                       
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 15)
            
            //Sign In Button
            Button {
                Task {
                    try await viewModelObj.createUser(withEmail:emailTxt, password:passwordTxt, fullName:fullNameTxt)
                }
            } label: {
                HStack {
                    Text("SIGN UP")
                        .font(.custom("PlayfairDisplay-Bold", size: 17))
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 50)
            }
            .background(Color(.systemBlue))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10.0)
            .padding(.top, 25)
            
            Spacer()
            
            Button {
                dismiss()
            } label:  {
                HStack(spacing: 3){
                Text("Already have an account?")
                Text("SIGN IN")
                    .fontWeight(.bold)
            }
            .font(.system(size: 15))
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol
extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !emailTxt.isEmpty
         && emailTxt.contains("@")
         && !fullNameTxt.isEmpty
         && fullNameTxt.count > 5
         && !passwordTxt.isEmpty
         && passwordTxt.count > 5
         && confirmPasswordTxt == passwordTxt
    }
}

#Preview {
    RegistrationView()
}
