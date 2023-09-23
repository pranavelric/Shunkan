//
//  CommentService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import Foundation
import Firebase

struct CommentService{
    static var commentsRef = Firestore.firestore().collection("comments")
    
    static func commentsId(postId:String) -> DocumentReference{
        return commentsRef.document(postId)
    }
    

    
    static func getComments(postId:String) async throws -> [Comment]{
        let snapshot  =  try await  CommentService.commentsId(postId: postId).collection("comments").getDocuments()
        
        var comments = try snapshot.documents.compactMap({try $0.data(as: Comment.self)})
        print(comments)
        print("Here")
        
        for i in 0..<comments.count {
            var comment = comments[i]
            let ownerUid = comment.ownerId
            let commentUser = try await UserService.fetchUser(withUid: ownerUid)
            comments[i].user = commentUser
        }
        
        let sortedComments = comments.sorted {  c1, c2 in
            return c1.timestamp.dateValue() > c2.timestamp.dateValue()
        }
        print("the comments are \(sortedComments)")
        
        return sortedComments
        
    }
    
    
}
