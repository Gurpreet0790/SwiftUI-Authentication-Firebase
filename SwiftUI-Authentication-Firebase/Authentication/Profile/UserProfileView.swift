//
//  UserProfileView.swift
//  SwiftUI-Authentication-Firebase
//
//  Created by ReetDhillon on 2024-01-26.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var viewModelObj: AuthViewModel
    var body: some View {
        if let user = viewModelObj.currentUser {
        List{
            Section{
                HStack {
                    Text(user.intials)
                        .font(.custom("PlayfairDisplay-Regular", size: 17))
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(user.fullName
                        )
                        .font(.custom("PlayfairDisplay-Bold", size: 15))
                        .fontWeight(.semibold)
                        .padding(.top, 5)
                        
                        Text(user.email)
                            .font(.custom("PlayfairDisplay-Regular", size: 15))
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Section("General"){
                HStack {
                    SettingsInformationView(imageNameStr: "gear", titleStr: "Version", tintColor: Color(.systemGray))
                    
                    Spacer()
                    
                    Text("5.0.0")
                        .font(.custom("PlayfairDisplay-Regular", size: 15))
                        .foregroundColor(.gray)
                }
            }
            
            Section("Account"){
                Button{
                    viewModelObj.signOut()
                } label: {
                    SettingsInformationView(imageNameStr: "arrow.left.circle.fill", titleStr: "Sign Out", tintColor: Color(.red))
                }
                
                Button{
                    print("Delete Account")
                } label: {
                    SettingsInformationView(imageNameStr: "xmark.circle.fill", titleStr: "Delete Account", tintColor: Color(.red))
                }
            }
        }
    }
    }
}

#Preview {
    UserProfileView()
}
