//
//  PostService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 21/09/23.
//

import Foundation
import Firebase

struct PostService{
    private static let postCollection  = Firestore.firestore().collection("posts")
    static func fetchFeedPosts() async throws -> [Post]{
        let snapshot  = try await postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        
        for i in 0..<posts.count {
            var post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        let sortedPosts = posts.sorted { post1, post2 in
            return post1.timestamp.dateValue() > post2.timestamp.dateValue()
        }
        
        return sortedPosts
    }
    
    static func fetchUserPost(uid:String) async throws ->[Post]{
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        let posts =  try snapshot.documents.compactMap({try $0.data(as: Post.self)})

        let sortedPosts = posts.sorted { post1, post2 in
            return post1.timestamp.dateValue() > post2.timestamp.dateValue()
        }
        
        return sortedPosts

    }
    
}
