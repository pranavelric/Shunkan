//
//  FeedCell.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 05/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack {
            // profile-pic- username feed-settings button
            NavigationLink (value: post.user, label: {
                HStack{
                    
                    
                    if ((post.user?.profilePictureURL) != nil){
                        AnimatedImage(url:   URL(string: post.user?.profilePictureURL ?? "") )
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
                    
                    
                    Text(post.user?.username ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    if((post.user?.isBlueTickEnabled)  != nil && post.user?.isBlueTickEnabled != false){
                        Image("bluetick")
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: 12, height: 12, alignment: .leading)
                            .opacity(1)
                    }
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "ellipsis").foregroundColor(.gray.opacity(0.6))
                    }
                    
                }.padding(.horizontal,8)
            })
            // post content
            if ((post.imageURL) != nil){
                AnimatedImage(url:   URL(string: post.imageURL) )
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .clipShape(Rectangle())
            }else{
                Image("profile_placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .clipShape(Rectangle())
            }
            
            // action-buttons
            HStack{
                Button{
                    
                } label: {
                    Image(systemName: "heart")
                }
                
                Button{
                    
                } label: {
                    Image(systemName: "message")
                }
                
                Button{
                    
                } label: {
                    Image(systemName: "paperplane")
                }
                
                Spacer()
                
                Button{
                    
                } label: {
                    Image(systemName: "bookmark")
                }
                
            }
            .padding(.leading,8)
            .padding(.trailing,8)
            .padding(.top,4)
            .foregroundColor(.gray.opacity(0.6))
                
            
            //likes label
            Text("\(post.likes.count) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            //caption label
            
            HStack {
                Text("\(post.user?.username ?? "") ")
                    .fontWeight(.semibold) +
                Text("\(post.caption)")
                
            } .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,1)
                .padding(.leading,10)
            
            //comment-label
            if post.comments.count > 0{
                Text("View all \(post.comments.count) comments")
                    .font(.footnote)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,10)
                    .padding(.top,-6)
                    .foregroundColor(.gray)
            }
      
            // time label
            Text("\(post.timestamp)")
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,-8)
                .foregroundColor(.gray)
//            Text("\(post.timestamp.timeAgoSinceNow())")
//                .font(.footnote)
//                .frame(maxWidth: .infinity,alignment: .leading)
//                .padding(.leading,10)
//                .padding(.top,-8)
//                .foregroundColor(.gray)
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_Posts[0])
    }
}
