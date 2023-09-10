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
        Story(id: "1", imageURL:  "https://w0.peakpx.com/wallpaper/362/897/HD-wallpaper-anime-boy-aesthetic-aesthetic-anime-aesthetic-anime-boy-anime-aesthetic-anime-boy-cute-cute-anime-boy-sad-anime-boy.jpg", timestamp: Date(), owner: User(id: "1", username: "johndoe", email: "john@example.com",  profilePictureURL:  "https://mobcup.net/images/wt/04caba7a86280e1096db24e6ec8eb1f1.jpg", bio: "I love photography.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])),
        Story(id: "2", imageURL:  "https://w0.peakpx.com/wallpaper/362/897/HD-wallpaper-anime-boy-aesthetic-aesthetic-anime-aesthetic-anime-boy-anime-aesthetic-anime-boy-cute-cute-anime-boy-sad-anime-boy.jpg", timestamp: Date(), owner: User(id: "2", username: "janedoe", email: "jane@example.com",  profilePictureURL:  "https://w0.peakpx.com/wallpaper/362/897/HD-wallpaper-anime-boy-aesthetic-aesthetic-anime-aesthetic-anime-boy-anime-aesthetic-anime-boy-cute-cute-anime-boy-sad-anime-boy.jpg", bio: "Travel enthusiast and foodie.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])),
        Story(id: "3", imageURL:  "https://w0.peakpx.com/wallpaper/738/298/HD-wallpaper-anime-boy-anime-anime-boy-books-library-reading-sun.jpg", timestamp: Date(), owner: User(id: "2", username: "janedoe", email: "jane@example.com",  profilePictureURL:  "https://w0.peakpx.com/wallpaper/738/298/HD-wallpaper-anime-boy-anime-anime-boy-books-library-reading-sun.jpg", bio: "Travel enthusiast and foodie.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])),
        // Add more mock stories as needed
    ]
}
