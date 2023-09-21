//
//  AuthService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 12/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore
class AuthSerivce{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    static let shared = AuthSerivce()
    
    init(){
        Task{
            try await loadUserData()
        }
    }
    @MainActor
    func login(email:String,password: String) async throws{
        do{
           
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        }
        catch{
            print("Debug: Failed to register user with error \(error.localizedDescription)")
            throw "\(error.localizedDescription)"
        }
    }
    @MainActor
    func createUser(email:String,password:String,username:String) async throws{
        do{
           
            print(email)
            print(password)
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid,username: username,email: email)
        }
        catch{
            print("Debug: Failed to register user with error \(error.localizedDescription)")
            throw "\(error.localizedDescription)"
            
           
        }
    }
    
    @MainActor
    func loadUserData() async throws{
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else {return}
//        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
//        
//        self.currentUser = try? snapshot.data(as: User.self)
        self.currentUser =  try await UserService.fetchUser(withUid: currentUid)
        
    }
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    

    private func uploadUserData(uid: String, username: String, email: String) async{
        let user = User(id: uid, username: username, email: email, stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])
        self.currentUser = user
        guard let encodeUser = try? Firestore.Encoder().encode(user) else {return}
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
    }
    
}
