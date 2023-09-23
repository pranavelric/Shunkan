//
//  FollowService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 22/09/23.
//

import Foundation

class FollowService: ObservableObject{
    
    static let shared = FollowService()
    
     @MainActor
     func updateFollowCount(userId:String,followingCount:@escaping (_ followingCount:Int)->Void,followersCount:@escaping(_ followersCount:Int)->Void )async  throws{
         let followingSnapshot = try await  ProfileService.followingCollection(userId: userId).getDocuments ()
         followingCount(followingSnapshot.documents.count)
         
         let followersSnapshot = try await  ProfileService.followersCollection(userId: userId).getDocuments ()
         followersCount(followersSnapshot.count)
         

    }
    
    
    
    
    func manageFollow(userID:String,followCheck:Bool,followingCount:@escaping (_ followingCount:Int)->Void,followersCount:@escaping(_ followersCount:Int)->Void ) async throws{
        if(!followCheck){

        try await follow(userId: userID, followingCount: followingCount, followersCount: followersCount)

            
        }
        else{
        
          try await unFollow(userId: userID, followingCount: followingCount, followersCount: followersCount)
        }
    }
    
    
    func follow(userId:String,followingCount:@escaping (_ followingCount:Int)->Void,followersCount:@escaping(_ followersCount:Int)->Void ) async throws{
        
        
        try await ProfileService.followingId(userId: userId).setData([:])
        try await self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
        
        try await ProfileService.followersId(userId: userId).setData([:])
        try await self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
        

        
        
    }
    
    
    func unFollow(userId:String,followingCount:@escaping (_ followingCount:Int)->Void,followersCount:@escaping(_ followersCount:Int)->Void ) async throws{
        
        
        let followingSnapshot = try? await ProfileService.followingId(userId: userId).getDocument()
        if let doc = followingSnapshot, doc.exists{
            try await doc.reference.delete()
            try await   self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
        }
        
        
        let followersSnapshot = try? await ProfileService.followersId(userId: userId).getDocument()
        if let doc = followersSnapshot, doc.exists{
            try await doc.reference.delete()
            try await   self.updateFollowCount(userId: userId, followingCount: followingCount, followersCount: followersCount)
        }
        
        
    }
    
    
}
