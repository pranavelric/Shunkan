//
//  Post.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 08/09/23.
//

import Foundation

struct Post:  Codable, Identifiable, Hashable ,Likable {
    var id: String
    var imageURL: String
    var caption: String
    var timestamp: Date
    var likes: [Like] = [] // Track likes on this post
    var comments: [Comment] = [] // Track comments on this post
    var user: User?
    var ownerUid: String
    // Additional properties and methods specific to posts

}


extension Post {
    static var MOCK_Posts: [Post] = [
        Post(id: "1", imageURL:  "https://images.unsplash.com/photo-1528360983277-13d401cdc186?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3870&q=80", caption: "Beautiful sunset!", timestamp: Date(), likes: Like.MOCK_Likes, comments: [],user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
        Post(id: "2", imageURL:  "https://images.unsplash.com/photo-1542051841857-5f90071e7989?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3870&q=80", caption: "Exploring the mountains.", timestamp: Calendar.current.date(byAdding: .hour, value: -1, to: Date())!, likes: [], comments: [],user: User.MOCK_USERS[1],ownerUid: NSUUID().uuidString),
        Post(id: "3", imageURL:  "https://images.unsplash.com/photo-1490806843957-31f4c9a91c65?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3870&q=80", caption: "Delicious food!", timestamp: Date(), likes: [], comments: [],user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
        
        // Add more mock posts as needed
    ]
}
