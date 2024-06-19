//
//  UnderLinedTextField.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

struct UnderLinedTextField: View {
    
    @Binding var emailIdString: String
    
    var body: some View {
        TextField("EnterYourEmail", text: $emailIdString)
            .frame(height: 30)
            .padding(.bottom, 10)
            .overlay(
                HStack {
                    Spacer()
                    if !emailIdString.isEmpty {
                        Button(action: {
                            self.emailIdString = ""
                        }, label: {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                        })
                        .padding(.trailing, 8)
                    }
                }
            )
            .overlay(
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.black),
                alignment: .bottom
            )
            .keyboardType(.emailAddress)
    }
}
