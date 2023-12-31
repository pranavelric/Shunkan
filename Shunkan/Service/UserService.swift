//
//  UserService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 18/09/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore


struct UserService{

    
    
    static func fetchUser(withUid uid:String) async throws -> User{
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
        
    }
    
    
    static func FetchAllUsers() async throws -> [User]{

       let snapshot = try await Firestore.firestore().collection("users").getDocuments()
       return snapshot.documents.compactMap({try? $0.data(as: User.self)})

    }
    
    static func upDateUserPosts(uid:String) async throws {
        let snapshot = Firestore.firestore().collection("users").document(uid)
        try await snapshot.updateData([
            "posts": FieldValue.increment(Int64(1))
        ])
    }

}
