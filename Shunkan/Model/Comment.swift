//
//  Comment.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 08/09/23.
//

import Foundation
import Firebase
struct Comment:  Codable, Identifiable, Hashable {
    var id: String
    var text: String
    var timestamp: Timestamp// The date and time the comment was posted
    var userName: String
    var profile:String?
    var postId:String
    var ownerId:String
    var user:User?



}



extension Comment{
    

    static var MOCK_Comment: [Comment] = [
        .init(id: "1", text: "Great photo!", timestamp: Timestamp(),userName: "Test",profile: "profile",postId:"postId",ownerId: "ownerId"),
        .init(id: "2", text: "Great photo!", timestamp: Timestamp(),userName: "Test",profile: "profile",postId:"postId",ownerId: "ownerId"),
        .init(id: "3", text: "Great photo!", timestamp: Timestamp(),userName: "Test",profile: "profile",postId:"postId",ownerId: "ownerId"),
        .init(id: "4", text: "Great photo!", timestamp: Timestamp(),userName: "Test",profile: "profile",postId:"postId",ownerId: "ownerId"),
        .init(id: "5", text: "Great photo!", timestamp: Timestamp(),userName: "Test",profile: "profile",postId:"postId",ownerId: "ownerId"),
    ]
}
