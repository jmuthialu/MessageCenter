//
//  HomeView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var nwConnectivity: NetworkConnectivity
    @FocusState var emailTextFieldFocusState: Bool
    @AppStorage("userEmailId") var emailIdString: String = ""
    
    @State var showEmailAlert = false
    @State private var path = NavigationPath()
    
    var errorMessage: String? {
        if !nwConnectivity.isConnected {
            return NetworkError.noNetwork.description
        }
        return nil
    }
    
    var errorIconName: String? {
        if !nwConnectivity.isConnected {
            return NetworkError.noNetwork.iconName
        }
        return nil
    }
    
    var body: some View {
        NavigationStack(path: $path) {
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
                    .padding(.bottom, 25)
                
                ButtonWithErrorHandler(buttonText: String(localized: StringConstants.getMessages),
                                       errorMessage: errorMessage,
                                       errorIconName: errorIconName) {
                    let trimmedEmailString = emailIdString.trimmingCharacters(in: .whitespacesAndNewlines)
                    emailIdString = trimmedEmailString
                    if emailIdString.isValidEmailId() {
                        path.append(emailIdString)
                    } else {
                        showEmailAlert = true
                    }
                }
                .alert(isPresented: $showEmailAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("PleaseEnterValidEmail")
                    )
                }
                
                Spacer()
            }
            // Make entire VStack tappable
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                emailTextFieldFocusState = false
            }
            .navigationDestination(for: String.self) { emailString in
                MessagesContainerView(emailString: emailString)
                    .toolbarRole(.editor)
            }
        }
    }
}
