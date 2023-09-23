//
//  Messages.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import Foundation
import Firebase

struct Messages: Encodable, Decodable, Hashable{
    var id = UUID()
    var lastMessage: String
    var userId:String
    var profile: String?
    var username: String
    var timeStamp:Timestamp
    var isPhoto:Bool
}
