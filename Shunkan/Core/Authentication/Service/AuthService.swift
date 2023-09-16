//
//  AuthService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 12/09/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

class AuthSerivce{
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthSerivce()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    @MainActor
    func login(email:String,password: String) async throws{
        do{
           
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }
        catch{
            print("Debug: Failed to register user with error \(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(email:String,password:String,username:String) async throws{
        do{
           
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        }
        catch{
            print("Debug: Failed to register user with error \(error.localizedDescription)")
            throw "\(error.localizedDescription)"
            
           
        }
    }
    
    func loadUserData() async throws{
        
    }
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
}
