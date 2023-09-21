//
//  Likable.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 08/09/23.
//

import Foundation
import Foundation

// Define a protocol to represent any object that can be liked (e.g., posts and comments).
protocol Likable {
    var likes: [Like] { get set }
    // Other properties and methods specific to the likable object
}

// Define a Like model to represent a user's like on a likable object.
struct Like:  Codable, Identifiable, Hashable{
    var id: String
    var user: User // The user who liked the object
    var timestamp: Date // The date and time the like was added


}


// Create mock data for the Like model
extension Like {
    static var MOCK_Likes: [Like] = [
        Like(id: "1", user:  User(id: "1", username: "johndoe", email: "john@example.com",  profilePictureURL:  "https://example.com/user1.jpg", bio: "I love photography.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0), timestamp: Date()),
        Like(id: "2",  user: User(id: "2", username: "janedoe", email: "jane@example.com",  profilePictureURL: "https://example.com/user2.jpg", bio: "Travel enthusiast and foodie.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0), timestamp: Date()),
        Like(id: "3", user: User(id: "3", username: "alice", email: "alice@example.com",  profilePictureURL:  "https://example.com/user3.jpg", bio: "Art lover and painter.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0), timestamp: Date()),
    ]
}

//// Sample usage for a Post model that conforms to the Likable protocol:
//
//// Sample usage:
//
//let user = User(userID: "1", username: "johndoe", email: "john@example.com", password: "hashedPassword")
//let post = Post(postID: "123", imageURL: postImageURL, caption: "Amazing photo!", timestamp: Date())
//let like = Like(likeID: "456", user: user, timestamp: Date())
//
//// To like a post, add the like to the post's likes array.
//post.likes.append(like)
//
//// To unlike a post, remove the like from the post's likes array.
//if let index = post.likes.firstIndex(where: { $0.likeID == like.likeID }) {
//    post.likes.remove(at: index)
//}
