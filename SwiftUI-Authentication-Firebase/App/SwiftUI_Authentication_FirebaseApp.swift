//
//  SwiftUI_Authentication_FirebaseApp.swift
//  SwiftUI-Authentication-Firebase
//
//  Created by ReetDhillon on 2024-01-26.
//

import SwiftUI
import Firebase

@main
struct SwiftUI_Authentication_FirebaseApp: App {
    @StateObject var viewModelObj = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModelObj)
        }
    }
}
