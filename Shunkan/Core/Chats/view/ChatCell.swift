//
//  ChatCell.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase
struct ChatCell: View {
    
    let user = User.MOCK_USERS[0]
    
    let chat:Chat
    @State var isCurrentUser = false
    var body: some View {
        HStack{
            if !isCurrentUser{
                VStack(alignment: .leading){
                    Text(user.username)
                        .font(.caption2)
                        .padding(.leading,40)
                    HStack{
                        if ((chat.profile) != nil){
                            AnimatedImage(url:   URL(string: chat.profile ?? "") )
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
                        
                        
                        
                        
                        
                        Text("\(chat.textMessage)")
                            .padding(10)
                            .foregroundColor(Color.black)
                            .background( Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                            .cornerRadius(10)
                        
                    }
                    
                }
                Spacer()
                
            }
            
            else{
                Spacer()
                Text("\(chat.textMessage)")
                          .padding(10)
                          .foregroundColor( Color.white)
                          .background( Color.pink )
                          .cornerRadius(10)
            }
            
         
            
           
          
            
        }.padding(.horizontal)
            .foregroundColor(.black)
            .onAppear{
             isCurrentUser =  AuthSerivce.shared.currentUser?.id == chat.sender
            }
        
    }
}

#Preview {
    ChatCell(chat: Chat(id: "12", messageId: "12", textMessage: "test", photoUrl: "", sender: "1", username: "pranav", timeStamp: Timestamp(), isPhoto: false))
}
