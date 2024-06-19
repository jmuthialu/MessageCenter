//
//  MessagesContainerView.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/19/24.
//

import SwiftUI

struct MessagesContainerView: View {
    
    @ObservedObject var viewModel = MessagesViewModel(
        messagesAPI: MessagesAPI(forType: .http)
    )
    let emailString: String
    
    var body: some View {
        VStack(alignment: .leading) {
            MessageCenterHeader()

            Spacer()
            
            if viewModel.errorMessage.isEmpty {
                MessagesView(messages: viewModel.messages)
            } else {
                TryAgainView(errorMessage: viewModel.errorMessage) {
                    Task {
                        await viewModel.getMessages(forEmailID: emailString)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            
            Spacer()
        }
        .task {
            await viewModel.getMessages(forEmailID: emailString)
        }
        .refreshable {
            await viewModel.getMessages(forEmailID: emailString)
        }
        .overlay {
            if viewModel.showProgressView {
                ProgressView()
            }
        }
    }
}

#Preview {
    let viewModel = MessagesViewModel(messagesAPI: MessagesAPI(forType: .http))
    MessagesContainerView(viewModel: viewModel, emailString: "mtaylor@gmail.com")
}
