//
//  MessageCellView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase
struct MessageCellView: View {
    let message:Messages
    @StateObject var viewModel:MessagesCellViewModel
    init(message:Messages){
        self.message = message
        
        self._viewModel = StateObject(wrappedValue: MessagesCellViewModel(id: message.receiverId))
    }
    var body: some View {
        
        if let user = viewModel.user{
            NavigationLink(destination: ChatsView(user: user ).navigationBarBackButtonHidden(true)){
                HStack{
                    
                    
                    if ((viewModel.user?.profilePictureURL) != nil){
                        AnimatedImage(url:   URL(string: viewModel.user?.profilePictureURL ?? "") )
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40,height: 40)
                            .clipShape(Circle())
                        
                    }else{
                        Image("profile_placeholder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40,height: 40)
                            .clipShape(Circle())
                    }
                    
                    
                    
                    VStack(alignment: .leading){
                        Text(viewModel.user?.username ?? "Unknown")
                            .fontWeight(.semibold)
                        
                        Text(message.lastMessage).font(.footnote)
                        
                    }.font(.footnote)
                    
                    
                    
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "camera").foregroundColor(.black.opacity(0.6))
                    }
                    
                }.padding(.horizontal)
                    .foregroundColor(.black)
                
            }
        }
    }
}

#Preview {
    MessageCellView(message: Messages(lastMessage: "last message", userId: "1", username: "test", timeStamp: Timestamp(), isPhoto: false, receiverId: "1"))
}
