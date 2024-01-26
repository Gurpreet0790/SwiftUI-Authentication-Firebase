//
//  SettingsInformationView.swift
//  SwiftUI-Authentication-Firebase
//
//  Created by ReetDhillon on 2024-01-26.
//
import SwiftUI

struct SettingsInformationView: View {
    let imageNameStr: String
    let titleStr: String
    var tintColor: Color
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: imageNameStr)
                .imageScale(.small)
                .font(.custom("PlayfairDisplay-Regular", size: 15))
                .foregroundColor(tintColor)
            
            Text(titleStr)
                .font(.custom("PlayfairDisplay-Regular", size: 15))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingsInformationView(imageNameStr: "gear", titleStr: "Version", tintColor: Color(.systemGray))
}
