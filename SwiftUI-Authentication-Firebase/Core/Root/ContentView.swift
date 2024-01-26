//
//  ContentView.swift
//  SwiftUI-Authentication-Firebase
//
//  Created by ReetDhillon on 2024-01-26.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModelObj: AuthViewModel
    var body: some View {
        Group{
            if viewModelObj.userSession != nil {
              UserProfileView()
            }
            else
            {
                LoginView()
            }
        }
    }
}
