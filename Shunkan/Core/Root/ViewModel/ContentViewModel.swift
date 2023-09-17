//
//  ContentViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 12/09/23.
//

import Foundation
import Firebase
import FirebaseAuth
import Combine


class ContentViewModel: ObservableObject{
    private let service = AuthSerivce.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    init(){
        setupSubscribers()
    }
    
    func setupSubscribers(){
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
        
    }
    
}
