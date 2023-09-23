//
//  CommentCell.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentCell: View {
    let user: User
    let comment: Comment
    var body: some View {
        NavigationStack{
                NavigationLink (value: user, label: {
                    HStack{
                        
                        
                        if ((user.profilePictureURL) != nil){
                            AnimatedImage(url:   URL(string: user.profilePictureURL ?? "") )
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
                            Text(user.username)
                                .fontWeight(.semibold)

                            Text(comment.text).font(.footnote)

                        }.font(.footnote)
                        
                        
                        
                        Spacer()
                        
                        Text(comment.timestamp.dateValue().timeAgoSinceNow()).font(.footnote)
                        
                    }.padding(.horizontal)
                        .foregroundColor(.black)
                })
           
            
           
          
        }
    }
}

#Preview {
    CommentCell(user: User.MOCK_USERS[0],comment: Comment.MOCK_Comment[0])
}
