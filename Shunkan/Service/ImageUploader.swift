//
//  ImageUploader.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 18/09/23.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage


struct ImageUploader{
    

    static func uploadImage(image: UIImage, type:String = "profile_images") async throws -> String?{
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/\(type)/\(filename)")
        
        do{
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        }
        catch{
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }

    
    static func uploadChatImage(image: UIImage,storageChatRef:StorageReference) async throws -> String?{
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let output = try await storageChatRef.putDataAsync(imageData)

        do{
            let _ = try await storageChatRef.putDataAsync(imageData)
            let url = try await storageChatRef.downloadURL()
            return url.absoluteString
        }
        catch{
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }

//    
//    
//    static func uploadChatsImage(imageData:Data,messageId:String,recipientId:String,recipientProfile:String,recipientName:String,senderId:String,senderUserName:String,senderProfilePic:String,metaData:StorageMetadata,storageChatRef:StorageReference) async throws{
//        let output = try await storageChatRef.putDataAsync(imageData,metadata: metaData)
//        
//        let downloadUrl = try await storageChatRef.downloadURL()
//        let downloadUrlString = downloadUrl.absoluteString
//        let chat = Chat(id: messageId, messageId: messageId, textMessage: "", profile: senderProfilePic, photoUrl: downloadUrlString, sender: senderId, username: senderUserName, timeStamp: Timestamp(), isPhoto: true)
//        
//        guard let encodedChat = try? Firestore.Encoder().encode(chat) else {return}
//        try await ChatService.conversation(sender: senderId, recipient: recipientId).document(messageId).setData(encodedChat)
//        try await ChatService.conversation(sender: recipientId, recipient: senderId).document(messageId).setData(encodedChat)
//        
//        let SenderMessageDoc = ChatService.messageId(senderId: senderId, recipientId: recipientId)
//        let ReceiverMessageDoc = ChatService.messageId(senderId: recipientId, recipientId: senderId)
//        
//        let senderMessage = Messages( lastMessage: "", userId: senderId, profile: senderProfilePic, username: senderUserName, timeStamp: Timestamp(), isPhoto: true,receiverId: recipientId)
//        let recipientMessage = Messages(lastMessage: "", userId: recipientId, profile: recipientProfile, username: recipientName, timeStamp: Timestamp(), isPhoto: true,receiverId: senderId)
//        
//        guard let encodedSenderMessage = try? Firestore.Encoder().encode(senderMessage) else {return}
//        guard let encodedRecipientrMessage = try? Firestore.Encoder().encode(recipientMessage) else {return}
//        
//        try await SenderMessageDoc.setData(encodedSenderMessage)
//        try await ReceiverMessageDoc.setData(encodedRecipientrMessage)
//        
//    }
//    
    
    
}
