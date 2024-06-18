//
//  HomeView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = MessagesViewModel(
        messagesAPI: MessagesAPI(forType: .mock)
    )
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 50)
            
            Image("roomsToGo")
                .padding()
            
            Text("Message Center")
                .font(FontPalette.largeRegular.font)
                .padding(.bottom, 30)
            
            Text("Enter your email to search for your messages")
                .font(FontPalette.mediumRegular.font)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
