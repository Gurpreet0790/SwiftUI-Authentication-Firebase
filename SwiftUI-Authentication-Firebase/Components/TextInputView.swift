//
//  TextInputView.swift
//  SwiftUI-Authentication-Firebase
//
//  Created by ReetDhillon on 2024-01-26.
//

import SwiftUI

struct TextInputView: View {
    @Binding var textStr: String
    let titleStr: String
    let placeholderStr: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text(titleStr)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.custom("PlayfairDisplay-Regular", size: 15))
            
            if isSecureField{
                SecureField(placeholderStr, text: $textStr)
                    .font(.custom("PlayfairDisplay-Regular", size: 15))
                
            } else {
                TextField(placeholderStr, text: $textStr)
                    .font(.custom("PlayfairDisplay-Regular", size: 15))
            }
        }
    }
}

#Preview {
    TextInputView(textStr: .constant(""), titleStr: "Email Address", placeholderStr: "name@example.com")
}
