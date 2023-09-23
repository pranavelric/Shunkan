//
//  ChatsViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import Foundation
import Firebase
import FirebaseStorage

class ChatViewModel: ObservableObject{
    @Published var isLoading = false
    @Published var chats: [Chat] = []
    @Published var messages:[Messages] = []
    
    // here userId is of recipient
    init(userId:String){
        Task{
            try await getChats(userId:userId)
        }
    }
    
    @MainActor
    func sendMessage(message:String,recipientId:String,recipientProfile:String?,recipientName:String) async throws{
        guard let senderId = AuthSerivce.shared.currentUser?.id else {return}
        guard let senderUsername = AuthSerivce.shared.currentUser?.username else {return}
        let senderProfilePic = AuthSerivce.shared.currentUser?.profilePictureURL
        
        let messageId = ChatService.conversation(sender: senderId, recipient: recipientId).document().documentID
        let chat = Chat(id: messageId, messageId: messageId, textMessage: message, profile: senderProfilePic, photoUrl: "", sender: senderId, username: senderUsername, timeStamp: Timestamp(), isPhoto: false)
    
        guard let encodedChat = try? Firestore.Encoder().encode(chat) else {return}
        try await ChatService.conversation(sender: senderId, recipient: recipientId).document(messageId).setData(encodedChat)
        try await ChatService.conversation(sender: recipientId, recipient: senderId).document(messageId).setData(encodedChat)
        
        let SenderMessageDoc = ChatService.messageId(senderId: senderId, recipientId: recipientId)
        let ReceiverMessageDoc = ChatService.messageId(senderId: recipientId, recipientId: senderId)
        
        let senderMessage = Messages( lastMessage: message, userId: senderId, profile: senderProfilePic, username: senderUsername, timeStamp: Timestamp(), isPhoto: false)
        let recipientMessage = Messages(lastMessage: message, userId: recipientId, profile: recipientProfile, username: recipientName, timeStamp: Timestamp(), isPhoto: false)
        
        guard let encodedSenderMessage = try? Firestore.Encoder().encode(senderMessage) else {return}
        guard let encodedRecipientrMessage = try? Firestore.Encoder().encode(recipientMessage) else {return}
        
        try await SenderMessageDoc.setData(encodedSenderMessage)
        try await ReceiverMessageDoc.setData(encodedRecipientrMessage)

        try await getChats(userId: recipientId)
    }
    
    
    
    @MainActor
    func  sendImageMessage(imageData:Data,recipientId:String,recipientProfile:String,recipientName:String) async throws{
        guard let senderId = AuthSerivce.shared.currentUser?.id else {return}
        guard let senderUsername = AuthSerivce.shared.currentUser?.username else {return}
        guard let senderProfilePic = AuthSerivce.shared.currentUser?.profilePictureURL else {return}
        
        let messageId = ChatService.conversation(sender: senderId, recipient: recipientId).document().documentID
        
        let storageChatRef = StorageService.storageChatId(chatId: messageId)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        try await ImageUploader.uploadChatsImage(imageData: imageData, messageId: messageId, recipientId: recipientId, recipientProfile: recipientProfile, recipientName: recipientName, senderId: senderId, senderUserName: senderUsername, senderProfilePic: senderProfilePic, metaData: metaData, storageChatRef: storageChatRef)
        

    }
    
    
    // have to check
    @MainActor
    func getChats(userId:String) async throws{
        // all chats

        let chatsSnapshot = try await ChatService.conversation(sender: AuthSerivce.shared.currentUser!.id, recipient: userId).order(by: "timeStamp",descending: false).getDocuments()
       
        var chats = try chatsSnapshot.documents.compactMap({try $0.data(as: Chat.self)})

        
    

        self.chats = chats
    }
    
    func getMessages() async throws{
        let messageSnapshot = try await ChatService.userMessages(userId: AuthSerivce.shared.currentUser!.id).order(by: "timeStamp",descending: false).getDocuments()
        
        var messages = try messageSnapshot.documents.compactMap({try $0.data(as: Messages.self)})
        
        self.messages = messages
        
    }
    
    
    
}
