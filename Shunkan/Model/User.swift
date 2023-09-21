//
//  User.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 08/09/23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable ,  Codable{
    var id: String
//    let userID: String
    var username: String
    var fullName: String?
    var email: String
    //    var password: String // Make sure to hash and salt passwords
    var profilePictureURL: String?
    var bio: String?
    var bioLink: String?
    var stories: [Story]
    var highlights: [Highlight]
    var friends: [User]
    var followers: [User]
    var following: [User]
    var posts: Int = 0
    var isBlueTickEnabled: Bool = false
  
    
    
    var isCurrentUser: Bool  {
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }

}


extension User{
    static var MOCK_USERS: [User] = [
        
        .init(id: "1", username: "johndoe",fullName: "John Doe", email: "john@example.com",  profilePictureURL: "https://yt3.ggpht.com/yti/AOXPAcVqqZQjftxmu5EFTsugItxNXkYCXAgx-gG_OjOUdg=s88-c-k-c0x00ffffff-no-rj", bio: "I love photography.", bioLink: "gogoanimehd.io",  stories: [], highlights: Highlight.MOCK_Highlights, friends: [], followers: [], following: [], posts: 0),
        
        .init(id: "2", username: "janedoe", fullName: "Jane Doe", email: "jane@example.com",  profilePictureURL: "https://img.freepik.com/premium-photo/japanese-girl-cherry-blossom-tree-landscape-anime-manga-illustration_691560-7776.jpg?w=2000", bio: "Travel enthusiast and foodie.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0),
        
        .init(id: "3", username: "alice",fullName: "Alice Elric", email: "alice@example.com",  profilePictureURL: "https://mobcup.net/images/wt/04caba7a86280e1096db24e6ec8eb1f1.jpg", bio: "Art lover and painter.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0),
        
        .init(id: "4", username: "Test",fullName: "lorem ipsum", email: "test@example.com",  profilePictureURL: nil, bio: "new user.", stories: [], highlights: [], friends: [], followers: [], following: [], posts: 0)

    ]
}
