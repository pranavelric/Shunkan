//
//  Message.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 09/09/23.
//

import Foundation

struct Message: Codable, Identifiable {
    var id: String
    var sender: User
    var text: String
    var timestamp: Date
    var conversationID: String // Reference to the conversation
//    var recipients: [User] // List of recipients (for group messages)

}

// Define a Conversation model to represent a conversation between users.
struct Conversation: Codable, Identifiable {
    var id: String
    var type: ConversationType // Enum representing the conversation type
    var participants: [User] // The users involved in the conversation, including group members
    var messages: [Message]

  
}

// Define an enum for conversation types
enum ConversationType: Codable {
    case oneOnOne
    case group
}



extension Message {
    
static var userA = User(id: "1", username: "johndoe", email: "john@example.com",  profilePictureURL: "https://example.com/user1.jpg", bio: "I love photography.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])
static var userB =  User(id: "2", username: "janedoe", email: "jane@example.com",  profilePictureURL: "https://example.com/user2.jpg", bio: "Travel enthusiast and foodie.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])
static var userC = User(id: "3", username: "alice", email: "alice@example.com",  profilePictureURL:  "https://example.com/user3.jpg", bio: "Art lover and painter.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])
    
    static var MOCK_Messages: [Message] = [
        Message(id: "1", sender: userA, text: "Hi, how are you?", timestamp: Date(), conversationID: "1"),
        Message(id: "2", sender: userB, text: "I'm good, thanks!", timestamp: Date(), conversationID: "1"),
        Message(id: "3", sender: userA, text: "Hello, everyone!", timestamp: Date(), conversationID: "2"),
        Message(id: "4", sender: userC, text: "Hi there!", timestamp: Date(), conversationID: "2"),
        Message(id: "5", sender: userB, text: "Heya!", timestamp: Date(), conversationID: "2"),
        
    ]
}

extension Conversation {
    
    static var userA = User(id: "1", username: "johndoe", email: "john@example.com",  profilePictureURL:  "https://example.com/user1.jpg", bio: "I love photography.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])
    static var userB =  User(id: "2", username: "janedoe", email: "jane@example.com",  profilePictureURL: "https://example.com/user2.jpg", bio: "Travel enthusiast and foodie.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])
    static var userC = User(id: "3", username: "alice", email: "alice@example.com",  profilePictureURL:  "https://example.com/user3.jpg", bio: "Art lover and painter.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])
    
    
    static var MOCK_Conversations: [Conversation] = [
        Conversation(
            id: "1",
            type: .oneOnOne,
            participants: [userA, userB],
            messages: Message.MOCK_Messages.filter { $0.conversationID == "1" }
        ),
        Conversation(
            id: "2",
            type: .group,
            participants: [userA, userB, userC],
            messages: Message.MOCK_Messages.filter { $0.conversationID == "2" }
        ),
      
    ]
}
