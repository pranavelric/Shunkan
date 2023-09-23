//
//  Chat.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 22/09/23.
//

import Foundation
import Firebase

struct Chat: Encodable, Decodable, Hashable{
    var id:String
    var messageId: String
    var textMessage: String
    var profile: String?
    var photoUrl: String
    var sender: String
    var username: String
    var timeStamp:Timestamp
    var isCurrentUser:Bool{
        return AuthSerivce.shared.currentUser!.id == sender
    }
    var isPhoto:Bool
}
