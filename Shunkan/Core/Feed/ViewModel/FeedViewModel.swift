//
//  FeedViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 20/09/23.
//

import Foundation
import Firebase
class FeedViewModel:ObservableObject{
    @Published var posts = [Post]()
    
    
    
    init(){
        
        Task{
            try await fetchPosts()
        }
    }
    
    
    @MainActor
    func fetchPosts() async throws{
        self.posts = try await PostService.fetchFeedPosts()
        
//        let snapshot  = try await Firestore.firestore().collection("posts").getDocuments()
//        self.posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
//        
//        for i in 0..<posts.count {
//            var post = posts[i]
//            let ownerUid = post.ownerUid
//            let postUser = try await UserService.fetchUser(withUid: ownerUid)
//            posts[i].user = postUser
//        }
        
//        for post in posts{
//            let ownerUid = post.ownerUid
//            let postUser = try await UserService.fetchUser(withUid: ownerUid)
//            post.user = postUser
//        }
        
        
    }
}
