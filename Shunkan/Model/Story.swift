//
//  Story.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 09/09/23.
//

import Foundation
struct Story :  Codable, Identifiable, Hashable{
    var id: String
    var imageURL: String // The URL to the story image
    var timestamp: Date // The date and time the story was created
    var owner: User // The user who posted the story
    
   
}


extension Story {
    static var MOCK_Stories: [Story] = [
        Story(id: "1", imageURL:  "https://example.com/story1.jpg", timestamp: Date(), owner: User(id: "1", username: "johndoe", email: "john@example.com",  profilePictureURL:  "https://example.com/user1.jpg", bio: "I love photography.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])),
        Story(id: "2", imageURL:  "https://example.com/story2.jpg", timestamp: Date(), owner: User(id: "2", username: "janedoe", email: "jane@example.com",  profilePictureURL:  "https://example.com/user2.jpg", bio: "Travel enthusiast and foodie.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])),
        Story(id: "3", imageURL:  "https://example.com/story3.jpg", timestamp: Date(), owner: User(id: "2", username: "janedoe", email: "jane@example.com",  profilePictureURL:  "https://example.com/user2.jpg", bio: "Travel enthusiast and foodie.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])),
        // Add more mock stories as needed
    ]
}
