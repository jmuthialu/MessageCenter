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
            
            Text("messageCenter")
                .font(FontPalette.largeRegular.font)
                .padding(.bottom, 30)
            
            Text("enterYourEmail")
                .font(FontPalette.mediumRegular.font)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
