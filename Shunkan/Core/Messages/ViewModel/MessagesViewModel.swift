//
//  MessagesViewModel.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import Foundation
import Firebase
import FirebaseStorage

class MessagesViewModel: ObservableObject{
    @Published var isLoading = false
    @Published var messages:[Messages] = []
    
    
    // here userId is of recipient
    init(){
        Task{
            try await getMessages()
        }
    }
    
    @MainActor
    func getMessages() async throws{
        let messageSnapshot = try await ChatService.userMessages(userId: AuthSerivce.shared.currentUser!.id).order(by: "timeStamp",descending: false).getDocuments()
        
        let messages = try messageSnapshot.documents.compactMap({try $0.data(as: Messages.self)})
        
        self.messages = messages
        
    }
    
    
    
}
