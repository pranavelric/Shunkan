//
//  Comment.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 08/09/23.
//

import Foundation
struct Comment:  Codable, Identifiable, Hashable {
    var id: String
    var text: String
    var user: User // The user who made the comment
    var timestamp: Date // The date and time the comment was posted


}



extension Comment{
    static var  MOCK_USER = User(id: "1", username: "johndoe", email: "john@example.com", profilePictureURL:  "https://example.com/user1.jpg", bio: "I love photography.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: [])

    static var MOCK_Comment: [Comment] = [
        .init(id: "1", text: "Great photo!", user: MOCK_USER, timestamp: Date()),
        .init(id: "2", text: "Nice photo!", user: MOCK_USER, timestamp: Date()),
        .init(id: "3", text: "Not So Great photo!", user: MOCK_USER, timestamp: Date()),
        .init(id: "4", text: "Not so Nice photo!", user: MOCK_USER, timestamp: Date())
    ]
}
