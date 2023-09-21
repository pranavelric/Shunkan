//
//  UploadPostViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 10/09/23.
//

import Foundation
import UIKit
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject{
    
    @Published var postImage: UIImage?
    @Published var isUploadingPost: Bool = false
    
    
    func uploadPost(caption:String) async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return }
        guard let uiImage = postImage else {return }
        
        let postRef =  Firestore.firestore().collection("posts").document()
        // change it
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage,type: "posts") else {return}
        let post = Post(id: postRef.documentID, imageURL: imageUrl, caption: caption, timestamp: Timestamp(), ownerUid: uid)
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {return}
        
        try await postRef.setData(encodedPost)
        try await UserService.upDateUserPosts(uid: uid)
    }
    
}
