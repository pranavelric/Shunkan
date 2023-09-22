//
//  FeedCellService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import Foundation
import Firebase

@MainActor
class FeedCellService: ObservableObject{
    
    // for cell
    @Published var isLiked =  false
    @Published var post: Post?
    
    
    init(postId:String){
        Task{
            try await fetchPost(postId:postId)
        }
        hasLikedPost()
    }
    // for cell
    func hasLikedPost(){
        isLiked = (post?.likes["\(AuthSerivce.shared.currentUser!.id )"] == true)
    }
    
    func like(){
        post!.likeCount += 1
        isLiked = true
        
        Firestore.firestore().collection("posts").document(post!.id).updateData([
            "likeCount": FieldValue.increment(Int64(1)),
            "like" : ["\(AuthSerivce.shared.currentUser!.id )" : true]
        ])
    }
    
    func unLike(){
        post!.likeCount -= 1
        isLiked = false
        
        Firestore.firestore().collection("posts").document(post!.id).updateData([
            "likeCount": FieldValue.increment(Int64(-1)),
            "like" : ["\(AuthSerivce.shared.currentUser!.id)" : false]
        ])
    }
    
    @MainActor
    func fetchPost(postId:String) async throws {

     let docSnap =  try? await Firestore.firestore().collection("posts").document(postId).getDocument()
        if let doc = docSnap, doc.exists{
            self.post = try doc.data(as: Post.self)
        }
    }
}
