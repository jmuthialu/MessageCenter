//
//  MainApp.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/18/24.
//

import SwiftUI

@main
struct MainApp: App {
    
    @StateObject var nwConnectivity = NetworkConnectivity()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(nwConnectivity)
        }
    }
}
