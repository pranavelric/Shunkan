//
//  ChatService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 22/09/23.
//

import Foundation
import Firebase

struct ChatService{
 
    static var chats = Firestore.firestore().collection("chats")
    static var messages = Firestore.firestore().collection("messages")
    
    
    static func conversation(sender:String,recipient:String) -> CollectionReference{
        return chats.document(sender).collection("chats").document(recipient).collection("conversation")
    }
    
    
    static func userMessages(userId:String) -> CollectionReference{
        return messages.document(userId).collection("messages")
    }
    

    static func messageId(senderId:String,recipientId:String) -> DocumentReference{
        return messages.document(senderId).collection("messages").document(recipientId)
    }
    
    
}
