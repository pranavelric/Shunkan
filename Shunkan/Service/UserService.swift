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

    static func FetchAllUsers() async throws -> [User]{
//        var users = [User]()
       let snapshot = try await Firestore.firestore().collection("users").getDocuments()
       return snapshot.documents.compactMap({try? $0.data(as: User.self)})
//       let documents = snapshot.documents
//
//        for doc in documents{
//            guard let user = try? doc.data(as: User.self) else {return users}
//            users.append(user)
//        }
//        return users
    }
    
}
