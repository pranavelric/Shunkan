//
//  MessageView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MessageView: View {
    let currentUser = AuthSerivce.shared.currentUser
    @Environment(\.dismiss) var dismiss
    @StateObject var messageViewModel = MessagesViewModel()
    @State var searchText:String = ""
    
    var searchResults: [Messages] {
        if searchText.isEmpty {
            return messageViewModel.messages
        }
        return messageViewModel.messages.filter { $0.receiverUsername.contains(searchText) }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                // if messages not empty
                if true {
                    ScrollView{
                        
                        LazyVStack(spacing: 24){
                            ForEach(searchResults){ message in
                                
                                MessageCellView( message: message)
                             
                            }
                        } .searchable(text: $searchText)

                    }.padding(10)
                }
                else{
                    
                    Image("chats_empty")
                        .resizable()
                        .scaledToFit()
                    
                    Text("No messages found...") .foregroundColor(.pink)
                        .font(.headline)
                }
                                
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
                      
                      if (currentUser?.profilePictureURL != nil){
                          AnimatedImage(url:   URL(string: currentUser?.profilePictureURL ?? "") )
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
                      
                                
                      Text("\(currentUser?.username ?? "")")
                          .font(.title2)
                          .fontWeight(.bold)
                          .foregroundColor(.primary)
                  }
              }
                
                
              ToolbarItem(placement: .navigationBarTrailing){
                  
                  HStack{
                      Button{
                          
                      } label: {
                          Image(systemName: "square.and.pencil").foregroundColor(.gray.opacity(0.6))
                      }
                  }
              }
              
            }
        }
        
    }
}

#Preview {
    MessageView()
}
