//
//  Notification.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 08/09/23.
//

import Foundation

struct Notification: Codable, Identifiable, Hashable {

    var id: String
    var type: NotificationType // Enum representing the type of notification
    var sender: User // The user who performed the action that triggered the notification
    var receiver: User? // Explicitly specify the receiver
    var timestamp: Date // The date and time the notification was created
    var isRead: Bool // Indicates whether the notification has been read
    var object: NotificationObject? // The object associated with the notification (e.g., a post or comment)

    


    
}

// Define an enum to represent the type of notification (e.g., like, comment, follow).
enum NotificationType: Codable,Hashable {
    case like
    case comment
    case follow
    // Add more types as needed
}

// Define a protocol to represent any object that can be associated with a notification (e.g., posts and comments).
struct NotificationObject: Codable,Hashable, Identifiable{
    var id: String
    var objectID: String
    var objectType: String
    // Other properties and methods specific to the notification object
}


//struct PostNotificationObject: NotificationObject {
//    var id: String
//    var objectID: String
//    var postID: String
//}





// Create mock data for the Notification model
extension Notification {
    static var MOCK_Notifications: [Notification] = [
        Notification(id: "1", type: .like, sender: User(id: "1", username: "johndoe", email: "john@example.com",  profilePictureURL:  "https://example.com/user1.jpg", bio: "I love photography.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0),  receiver: User(id: "2", username: "janedoe", email: "jane@example.com",  profilePictureURL:  "https://example.com/user2.jpg", bio: "Travel enthusiast and foodie.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0) , timestamp: Date(), isRead: false, object: NotificationObject(id:"1",objectID: "1",objectType:"post")),
        
        Notification(id: "2", type: .comment, sender: User(id: "2", username: "janedoe", email: "jane@example.com",  profilePictureURL: "https://example.com/user2.jpg", bio: "Travel enthusiast and foodie.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0), receiver:  User(id: "1", username: "johndoe", email: "john@example.com",  profilePictureURL: "https://example.com/user1.jpg", bio: "I love photography.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0), timestamp: Date(),  isRead: true, object: NotificationObject(id:"2",objectID: "2",objectType:"post")),
        Notification(id: "3", type: .follow, sender: User(id: "1", username: "johndoe", email: "john@example.com",  profilePictureURL:  "https://example.com/user1.jpg", bio: "I love photography.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0), receiver: nil , timestamp: Date(), isRead: false, object: nil),
        // Add more mock notifications as needed
    ]
}



//// Sample usage:
//
//let sender = User(userID: "1", username: "johndoe", email: "john@example.com", password: "hashedPassword")
//let post = PostNotificationObject(objectID: "123")
//let notification = Notification(notificationID: "456", type: .like, sender: sender, timestamp: Date(), isRead: false, object: post)
//
//// You can create an array of notifications to store user notifications.
//var notifications: [Notification] = []
//
//// Sample function to mark a notification as read.
//func markNotificationAsRead(notificationID: String) {
//    if let index = notifications.firstIndex(where: { $0.notificationID == notificationID }) {
//        notifications[index].isRead = true
//    }
//}
//
//// Sample function to retrieve unread notifications for a user.
//func getUnreadNotifications(for user: User) -> [Notification] {
//    return notifications.filter { !$0.isRead && $0.sender.userID != user.userID }
//}
