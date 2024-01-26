//
//  UserInfo.swift
//  SwiftUI-Authentication-Firebase
//
//  Created by ReetDhillon on 2024-01-26.
//

import Foundation
struct UserInfo: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    
    var intials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension UserInfo{
    static var MOCK_USER = UserInfo(id: NSUUID().uuidString, fullName: "Reet Dhillon", email: "gurpreet.dhillon03@gmail.com")
}
