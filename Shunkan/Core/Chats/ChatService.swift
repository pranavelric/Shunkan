//
//  ChatService.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 22/09/23.
//

import Foundation

class ChatService: ObservableObject{
    @Published var isLoading = false
    @Published var chats: [Chat] = []
}
