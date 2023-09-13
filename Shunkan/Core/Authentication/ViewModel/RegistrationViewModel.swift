//
//  RegistrationViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 12/09/23.
//

import Foundation
class RegistrationViewModel: ObservableObject{
    @Published var username = ""
    @Published var email    = ""
    @Published var password = ""
    
    func createUser() async throws{
        try await AuthSerivce.shared.createUser(email: email, password: password, username: username)
    }
    
    
}
