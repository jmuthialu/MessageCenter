//
//  HomeView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = MessagesViewModel(
        messagesAPI: MessagesAPI(forType: .http)
    )
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            let emailId = "mtaylor@gmail.com"
            //            let emailId = "cshort@gmail.com"
            //            let emailId = "oduke@gmail.com"
            
            if emailId.isValidEmailId() {
                await viewModel.getMessages(forEmailID: emailId)
            } else {
                print("Error: Failed email validation \(emailId)")
            }
        }
    }
}

#Preview {
    HomeView()
}
