//
//  LoginViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 15/09/23.
//

import Foundation
class LoginViewModel: ObservableObject{
    
    @Published var email    = ""
    @Published var password = ""
    @Published var isLogginIn: Bool = false
    
    func signIn() async throws{
        try await AuthSerivce.shared.login(email: email, password: password)
    }
    
    
}
