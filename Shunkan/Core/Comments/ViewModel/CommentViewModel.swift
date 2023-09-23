//
//  CommentViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import Foundation
import Firebase
class CommentViewModel : ObservableObject{
//    static var commentsRef = Firestore.firestore().collection("comments")
//    
//    static func commentsId(postId:String) -> DocumentReference{
//        return commentsRef.document(postId)
//    }
    

    @Published var comments: [Comment] = []
    @Published var isLoading:Bool = false
    var postId:String!
    
    init(postId:String){
        self.postId = postId
        Task{
            try await fetchComments(postId:postId)
        }
    }
    
    
    
    @MainActor
    func fetchComments(postId:String) async throws{
        isLoading = true
        self.comments = try await  CommentService.getComments(postId: postId)
        isLoading = false
    }
    
    
    
    func postComment (comment: String, postId:String) async throws {
        
        let username = AuthSerivce.shared.currentUser!.username
        let profilePic = AuthSerivce.shared.currentUser!.profilePictureURL
        let ownerId =  AuthSerivce.shared.currentUser!.id
        
        let commentRef =  CommentService.commentsId(postId: postId).collection("comments").document()
        let comment = Comment(id: commentRef.documentID, text: comment, timestamp: Timestamp(), userName: username, profile: profilePic, postId: postId, ownerId: ownerId)
        guard let encodedPost = try? Firestore.Encoder().encode(comment) else {return}
        try await commentRef.setData(encodedPost)
        
        
        try await updatePostCommentCount(postId: postId)
        
        }

    func updatePostCommentCount(postId:String) async throws{
       try await Firestore.firestore().collection("posts").document(postId).updateData([
            "comments": FieldValue.increment(Int64(1)),
        ])
    }
    
    
    
    
    
}
