//
//  StorageService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import Foundation
import FirebaseStorage
struct StorageService{
    static var storage = Storage.storage()
    static var storageRoot = storage.reference()
    static var storageChat = storageRoot.child("chat")
    static func storageChatId(chatId:String) -> StorageReference{
        return storageChat.child(chatId)
    }
}
