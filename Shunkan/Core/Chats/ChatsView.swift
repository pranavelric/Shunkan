//
//  ChatsView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 22/09/23.
//

import SwiftUI
import Combine

struct ChatsView: View {
    
    @StateObject var chatService = ChatService()

    var recipientId = ""
    var recipientProfile = ""
    var recipientUsername = ""

    @State private var text: String = ""
    @State private var pickedImage: Image?
    @State private var chatImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data ()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error:String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh No 😭"
     
    @State private var cancellables: AnyCancellable?
    
 
    func errorCheck() -> String? {
        if text.trimmingCharacters (in: .whitespaces) .isEmpty
        {
            return "Please âdd some text"
        }
        
        return nil
    }
       
    func clearText (){
        self.text = ""
    }
    
    
    
    
    func sendMessage () {
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            self.clearText ()
            return
        }
//        chatService.sendMessage (message: text, recipientId: recipientId, recipientProfile: recipientProfile, recipientName:
//                                    recipientUsername, onSuccess: {
//            self.clearText ()
//        }){
//            (err) in
//            self.error = err
//            self.showingAlert = true
//            return
//            
//        }
    }
    
    func sendPhoto () {
        if !imageData.isEmpty {
//            chatService.sendPhotoMessage (imageData: imageData, recipientId:
//                                            recipientId, recipientProfile: recipientProfile,
//                                          recipientName: recipientUsername, onSuccess: {}) {
//                (err) in
//                self.error = err
//                self.showingAlert = true
//                return
//            }
        }
    }
    
    
    
    
    
    
    var body: some View {
        VStack{
            if !chatService.chats.isEmpty {
                ScrollView{
                    ScrollViewReader{ value in
                        ForEach (chatService.chats, id:\.messageId) { (chat) in
                            VStack{
                                if chat.isPhoto{
//                                    PhotoChat(chat: chat)
                                } else{
//                                    TextChat (chat: chat)
                                }
                            }.padding (.top)
                            
                        } .onAppear{
//                            value.scrollTo (chatService.chats.endIndex - 1)
                            cancellables = chatService.$chats.sink{ chat in
                                if chat.count > 0 {
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            value.scrollTo(chat[chat.endIndex - 1].messageId, anchor: .bottom)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            else{
                Text("Write sometings").bold()
            }
            
            Spacer()
            
            HStack{
                
            }
            
        }
       
    }
}

#Preview {
    ChatsView()
}
