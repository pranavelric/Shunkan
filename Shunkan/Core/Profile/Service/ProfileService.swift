//
//  ProfileService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 22/09/23.
//

import Foundation
import Firebase

struct ProfileService{
    
    static var followings = Firestore.firestore().collection("following")
    static var followers = Firestore.firestore().collection("followers")
    
    
    static func followingCollection(userId:String) ->CollectionReference{
        return followings.document(userId).collection("following")
    }
    
    
    static func followersCollection(userId:String) ->CollectionReference{
        return followers.document(userId).collection("followers")
    }
    
    static func followingId(userId:String) -> DocumentReference{
        return followings.document("\(AuthSerivce.shared.currentUser!.id)").collection("following").document(userId)
    }

    static func followersId(userId:String) -> DocumentReference{
        return followers.document(userId).collection("followers").document("\(AuthSerivce.shared.currentUser!.id)")
    }
    

    
}

