//
//  NetworkConnectivity.swift
//  MessageCenter
//
//  Created by Jay Muthialu on 6/24/24.
//


import Foundation
import Network
import Combine

class NetworkConnectivity: ObservableObject {
    
    let nwPathMonitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkConnectivity")
    
    @Published var isConnected = false
    var cancellables = Set<AnyCancellable>()
    
    init() {
        start()
    }
    
    func start() {
        let nwPathPassthrough = PassthroughSubject<NWPath, Never>()
        
        nwPathMonitor.pathUpdateHandler = { path in
            nwPathPassthrough.send(path)
        }
        
        nwPathPassthrough
            .receive(on: DispatchQueue.main)
            .sink { [weak self] path in
                if path.status == .satisfied {
                    self?.isConnected = true
                } else {
                    self?.isConnected = false
                }
        }
        .store(in: &cancellables)
        
        nwPathMonitor.start(queue: queue)
    }
}
