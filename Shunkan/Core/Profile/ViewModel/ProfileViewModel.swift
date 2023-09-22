//
//  ProfileViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 22/09/23.
//

import Foundation
import Firebase

@MainActor
class ProfileViewModel: ObservableObject{
    
    @Published var followings = 0
    @Published var followers = 0
    
    @Published var followCheck:Bool = false
    
    @Published var isProcessing: Bool = false
    
    init(userId:String){
        Task{
            try await loadData(userId: userId)
        }
    }
    
    @MainActor
    func loadData(userId:String) async throws{
        
            try await  followState(userId: userId)
            try await  follows(userId: userId)
            try await  followers(userId: userId)
        
    }
    
    @MainActor
    func followState(userId:String) async throws{
        
        let snapshot = try? await  ProfileService.followersId(userId: userId).getDocument()
        
        if  let doc = snapshot, doc.exists{
            self.followCheck = true
        }else{
            self.followCheck = false
        }
        
//        ProfileService.followersId(userId: userId).getDocument { ( document, error ) in
//            
//            if let doc = document, doc.exists {
//                self.followCheck = true
//            } else{
//                self.followCheck = false
//            }
//        }
        
    }
    
    
    @MainActor
    func follow(userId:String) async throws{
        if !self.followCheck{
              try await  FollowService.shared.follow(userId: userId, followingCount: { followingCount in
                    self.followings = followingCount
                }){ followersCount in
                    self.followers = followersCount
                }
            
            self.followCheck = true
        }else{
           try await FollowService.shared.unFollow(userId: userId, followingCount: { followingCount in
                self.followings = followingCount
            }){ followersCount in
                self.followers = followersCount
            }
            self.followCheck = false
        }
    }
  
    @MainActor
    func follows(userId:String) async throws{
        let followingSnapshot = try await  ProfileService.followingCollection(userId: userId).getDocuments ()
        self.followings = followingSnapshot.documents.count
        
//        ProfileService.followingCollection(userId: userId).getDocuments { (querySnapshot,error) in
//            if let doc = querySnapshot?.documents {
//                self.followings = doc.count
//            }
//        }
    }
    
    
    @MainActor
    func followers(userId:String) async throws{
        
        let followersSnapshot = try await  ProfileService.followersCollection(userId: userId).getDocuments ()
        self.followers =  followersSnapshot.count
        
//        ProfileService.followersCollection(userId: userId).getDocuments { (querySnapshot,error) in
//            if let doc = querySnapshot?.documents {
//                self.followers = doc.count
//            }
//        }
    }
    

    
}
