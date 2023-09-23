//
//  ChatsView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 22/09/23.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct ChatsView: View {
    
    @StateObject var chatviewModel:ChatViewModel
    
    let user :User

    init(user:User){
        self.user = user
        self._chatviewModel = StateObject(wrappedValue: ChatViewModel(userId: user.id))
    }
    
    @State private var text: String = ""

    @State var showSheet = false
    @State var isUploading = false
    @State private var cancellables: AnyCancellable?
    @Environment(\.dismiss) var dismiss

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
    
    
    
//    
//    func sendMessage () {
//        if let error = errorCheck() {
//            self.error = error
//            self.showingAlert = true
//            self.clearText ()
//            return
//        }
////       chatviewModel.sendMessage (message: text, recipientId: recipientId, recipientProfile: recipientProfile, recipientName:
////                                    recipientUsername, onSuccess: {
////            self.clearText ()
////        }){
////            (err) in
////            self.error = err
////            self.showingAlert = true
////            return
////            
////        }
//    }
    
//    func sendPhoto () {
//        if !imageData.isEmpty {
////            chatService.sendPhotoMessage (imageData: imageData, recipientId:
////                                            recipientId, recipientProfile: recipientProfile,
////                                          recipientName: recipientUsername, onSuccess: {}) {
////                (err) in
////                self.error = err
////                self.showingAlert = true
////                return
////            }
//        }
//    }
//    
//    
    
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                if !chatviewModel.chats.isEmpty {
                    ScrollView{
                        ScrollViewReader{ value in
                            ForEach (chatviewModel.chats, id:\.messageId) { (chat) in
                                VStack{
                                        ChatCell(chat:chat)

                                }.padding (.top)
                                
                            } .onAppear{
                                //                            value.scrollTo (chatService.chats.endIndex - 1)
                                cancellables = chatviewModel.$chats.sink{ chat in
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
                    
                    Image("chats_empty")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Write someting") .foregroundColor(.pink)
                        .font(.headline)
                }
                
                Spacer()
                
                
                
                HStack{
                    
                    Button{
                        // open media pice
                       showSheet = true

                    }label: {
                        Image(systemName: "camera")
                            .foregroundColor(.pink)
                    }
                    .sheet(isPresented: $showSheet) {
                        
                        MediaPicker(image: $chatviewModel.profileImage, isCanceled: .constant(false),cropTypeRectangle: true).interactiveDismissDisabled(true)
                        
                    }
                    
                    if let selectedImage = chatviewModel.profileImage{
                        Image(uiImage: selectedImage)
                       
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .clipped()
                        Spacer()
                        
                    }
                    else{
                        TextField("Message ...", text: $text,axis: .vertical)
                            .font(.footnote)
                            .lineLimit(4)
                            .padding(.horizontal,1)
                            .foregroundColor(.black)
                    }
                    
                    Button{
                        Task{
                            
                                if(chatviewModel.profileImage != nil){
                                    
                                    
                                    withAnimation{
                                        isUploading = true
                                    }
                                    
                                    
                                   try await chatviewModel.sendImageMessage( recipientId: user.id, recipientProfile: user.profilePictureURL, recipientName: user.username)
                                    
                                    withAnimation{
                                        isUploading = false
                                    }
                                    
                                    chatviewModel.profileImage = nil
                                }
                       
                            else{
                                
                                try await  chatviewModel.sendMessage(message:text,recipientId:user.id,recipientProfile:user.profilePictureURL ,recipientName:user.username)
                                text = ""
                            }
                        }
                    } label: {
                        if isUploading{
                            ProgressView()
                                .foregroundColor(.pink)
                        }
                        
                        else{
                            Text("send")
                                .foregroundColor(.pink)
                        }
                    }
                }
                
                .padding(10)
                .padding(.horizontal,5)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal,10)
                
                
            }
            .toolbar{
                
                

          
                  ToolbarItem(placement: .navigationBarLeading) {
                      Image(systemName: "chevron.left")
                          .imageScale(.large)
                          .onTapGesture {
                              dismiss()
                          }
                  }
                
                
       
              
              ToolbarItem(placement: .navigationBarLeading) {
                  HStack {
                      
                      if ((user.profilePictureURL) != nil){
                          AnimatedImage(url:   URL(string: user.profilePictureURL ?? "") )
                              .resizable()
                              .scaledToFill()
                              .frame(width: 30,height: 30)
                              .clipShape(Circle())
                          
                      }else{
                          Image("profile_placeholder")
                              .resizable()
                              .scaledToFill()
                              .frame(width: 30,height: 30)
                              .clipShape(Circle())
                      }
                      
                                
                      Text("\(user.username)")
                          .font(.title2)
                          .fontWeight(.bold)
                          .foregroundColor(.primary)
                  }
              }
              ToolbarItem(placement: .navigationBarTrailing){
                  
                  HStack{
                      Button{
                          
                      } label: {
                          Image(systemName: "video").foregroundColor(.gray.opacity(0.6))
                      }
                      
                      
                      Button{
                          
                      } label: {
                          Image(systemName: "line.3.horizontal").foregroundColor(.gray.opacity(0.6))
                      }
                  }
              }
              
            }
        }
        
    }
}


#Preview {
    ChatsView(user:User.MOCK_USERS[0])
}
