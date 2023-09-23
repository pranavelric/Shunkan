//
//  Post.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 08/09/23.
//

import Foundation
import Firebase
struct Post:  Codable, Identifiable, Hashable  {
    var id: String
    var imageURL: String
    var caption: String
    var timestamp: Timestamp
    var likes: [String:Bool] = [:] // Track likes on this post
    var comments: Int = 0 // Track comments on this post
    var user: User?
    var ownerUid: String
    var likeCount:Int = 0
    var geoLocationL:String?  
    // Additional properties and methods specific to posts

}


extension Post {
    static var MOCK_Posts: [Post] = [
        Post(id: "1", imageURL:  "https://images.unsplash.com/photo-1528360983277-13d401cdc186?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3870&q=80", caption: "Beautiful sunset!", timestamp: Timestamp(), likes: [:], comments: 0,user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
        Post(id: "2", imageURL:  "https://images.unsplash.com/photo-1542051841857-5f90071e7989?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3870&q=80", caption: "Exploring the mountains.", timestamp: Timestamp(), likes: [:], comments: 12,user: User.MOCK_USERS[1],ownerUid: NSUUID().uuidString),
        Post(id: "3", imageURL:  "https://images.unsplash.com/photo-1490806843957-31f4c9a91c65?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3870&q=80", caption: "Delicious food!", timestamp: Timestamp(), likes: [:], comments: 12,user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
      
        Post(id: "4", imageURL:  "https://cdn.pixabay.com/photo/2022/12/01/04/35/sunset-7628294_640.jpg", caption: "Beautiful sunset!", timestamp: Timestamp(), likes: [:], comments: 12,user: User.MOCK_USERS[2],ownerUid: NSUUID().uuidString),
        Post(id: "5", imageURL:  "https://repository-images.githubusercontent.com/412098143/e4c94bec-9e90-4be5-aa6b-1d2fa97fc420", caption: "Exploring the mountains.", timestamp: Timestamp(), likes: [:], comments: 12,user: User.MOCK_USERS[1],ownerUid: NSUUID().uuidString),
        Post(id: "6", imageURL:  "https://images.alphacoders.com/131/1314427.jpeg", caption: "Delicious food!", timestamp: Timestamp(), likes: [:], comments: 21,user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
      
        Post(id: "7", imageURL:  "https://assets-prd.ignimgs.com/2022/08/17/top25animecharacters-blogroll-1660777571580.jpg", caption: "Beautiful sunset!", timestamp: Timestamp(), likes: [:], comments: 12,user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
        Post(id: "8", imageURL:  "https://t3.ftcdn.net/jpg/04/49/19/08/360_F_449190831_i2whvIQdDIGtuIVWT6QfenWwmRApVJ5l.jpg", caption: "Exploring the mountains.", timestamp: Timestamp(), likes: [:], comments: 3,user: User.MOCK_USERS[1],ownerUid: NSUUID().uuidString),
        Post(id: "9", imageURL:  "https://static1.colliderimages.com/wordpress/wp-content/uploads/2023/06/luffy-from-one-piece-goku-from-dragon-ball-z-and-saitama-from-one-punch-man.jpg", caption: "Delicious food!", timestamp: Timestamp(), likes: [:], comments: 3,user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
        
        Post(id: "10", imageURL:  "https://ichef.bbci.co.uk/news/976/cpsprodpb/F382/production/_123883326_852a3a31-69d7-4849-81c7-8087bf630251.jpg", caption: "Beautiful sunset!", timestamp: Timestamp(), likes: [:], comments: 0,user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
        Post(id: "11", imageURL:  "https://www.hindustantimes.com/ht-img/img/2023/02/16/1600x900/6_short_romance_anime_for_love_on_the_go_1676523239120_1676523257580_1676523257580.jpg", caption: "Exploring the mountains.", timestamp: Timestamp(), likes: [:], comments: 2,user: User.MOCK_USERS[2],ownerUid: NSUUID().uuidString),
        Post(id: "12", imageURL:  "https://www.pixelstalk.net/wp-content/uploads/images6/Anime-Boy-Wallpaper-Desktop.jpg", caption: "Delicious food!", timestamp: Timestamp(), likes: [:], comments: 0,user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
        
        Post(id: "13", imageURL:  "https://cdn.pixabay.com/photo/2022/12/01/04/35/sunset-7628294_640.jpg", caption: "Beautiful sunset!", timestamp: Timestamp(), likes: [:], comments: 0,user: User.MOCK_USERS[2],ownerUid: NSUUID().uuidString),
        Post(id: "14", imageURL:  "https://repository-images.githubusercontent.com/412098143/e4c94bec-9e90-4be5-aa6b-1d2fa97fc420", caption: "Exploring the mountains.", timestamp: Timestamp(), likes: [:], comments: 0,user: User.MOCK_USERS[1],ownerUid: NSUUID().uuidString),
        Post(id: "15", imageURL:  "https://images.alphacoders.com/131/1314427.jpeg", caption: "Delicious food!", timestamp: Timestamp(), likes: [:], comments: 6,user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
        
        
        
        Post(id: "16", imageURL:  "https://www.pixelstalk.net/wp-content/uploads/images6/Anime-Boy-Wallpaper-Desktop.jpg", caption: "Delicious food!", timestamp: Timestamp(), likes: [:], comments: 0,user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString),
        
        Post(id: "17", imageURL:  "https://cdn.pixabay.com/photo/2022/12/01/04/35/sunset-7628294_640.jpg", caption: "Beautiful sunset!", timestamp: Timestamp(), likes: [:], comments: 0,user: User.MOCK_USERS[2],ownerUid: NSUUID().uuidString),
        Post(id: "18", imageURL:  "https://repository-images.githubusercontent.com/412098143/e4c94bec-9e90-4be5-aa6b-1d2fa97fc420", caption: "Exploring the mountains.", timestamp: Timestamp(), likes: [:], comments: 0,user: User.MOCK_USERS[1],ownerUid: NSUUID().uuidString),
        Post(id: "19", imageURL:  "https://images.alphacoders.com/131/1314427.jpeg", caption: "Delicious food!", timestamp: Timestamp(), likes: [:], comments: 11,user: User.MOCK_USERS[0],ownerUid: NSUUID().uuidString)
        
        // Add more mock posts as needed
    ]
}
