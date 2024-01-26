//
//  LoginView.swift
//  SwiftUI-Authentication-Firebase
//
//  Created by ReetDhillon on 2024-01-26.
//
import SwiftUI

struct LoginView: View {
    @State private var emailTxt = ""
    @State private var passwordTxt = ""
    @EnvironmentObject var viewModelObj: AuthViewModel
    

    var body: some View {
        NavigationStack{
            VStack{
                
                //Image
                Image("HarvardUniversity")
                    .resizable()
                    .scaledToFill()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120)
                    .padding(.vertical, 32)
                
                //Form Fields
                VStack(spacing: 24){
                    TextInputView(textStr: $emailTxt, titleStr: "Email Address", placeholderStr: "name@example.com")
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    TextInputView(textStr: $passwordTxt, titleStr: "Password", placeholderStr: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 15)
                
                //Sign In Button
                
                Button {
                    Task {
                        try await   viewModelObj.signIn(withEmail: emailTxt, password: passwordTxt)
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
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
                
                
                //Sign Up Button
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("SIGN UP")
                            .fontWeight(.bold)
                    }
                    .font(.custom("PlayfairDisplay-Bold", size: 15))
                }
                
               
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !emailTxt.isEmpty
         && emailTxt.contains("@")
         && !passwordTxt.isEmpty
         && passwordTxt.count > 5
    }
}

#Preview {
    LoginView()
}
