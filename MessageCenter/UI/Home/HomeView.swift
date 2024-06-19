//
//  HomeView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

struct HomeView: View {
    
    @FocusState var emailTextFieldFocusState: Bool
    @State var emailIdString = ""
    @State var showEmailAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 50)
                
                Image("roomsToGo")
                    .padding()
                
                Text("messageCenter")
                    .font(FontPalette.largeRegular.font)
                    .padding(.bottom, 30)
                
                Text("enterYourEmailToSearch")
                    .font(FontPalette.mediumRegular.font)
                    .padding(.bottom, 20)
                
                UnderLinedTextField(emailIdString: $emailIdString)
                    .focused($emailTextFieldFocusState)
                    .padding(.horizontal, 30)
                
                Button("GetMessages") {
                    if !emailIdString.isValidEmailId() {
                        showEmailAlert = true
                    }
                }
                .padding(.top, 30)
                .foregroundColor(Color(hex: "#004FB5"))
                .alert(isPresented: $showEmailAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("PleaseEnterValidEmail")
                    )
                }
                
                Spacer()
            }
        }
        .onTapGesture {
            emailTextFieldFocusState = false
        }
    }
}

#Preview {
    HomeView()
}
