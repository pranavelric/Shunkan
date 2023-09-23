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
    @StateObject var feedCellService: FeedCellService
    @State var presentComment:Bool = false
    init(post: Post) {
        self.post = post
        self._feedCellService = StateObject(wrappedValue: FeedCellService(postId: post.id))
    }
    
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
                    if(feedCellService.isLiked){
                        Task{
                            try await feedCellService.unLike()
                        }
                       
                    }
                    else{
                        Task{
                            try await  feedCellService.like()
                        }
                       
                    }
                } label: {
                    if(feedCellService.isLiked){
                        Image(systemName: "heart.fill").foregroundColor(.red)
                    }
                    else{
                        Image(systemName: "heart")
                    }
                }
                
              
                    Button{
                        presentComment = true
                    } label: {
                        Image(systemName: "message")
                    }
                    .sheet(isPresented: $presentComment) {
                        CommentView(postId: post.id)
                            .presentationDragIndicator(.visible)
                           
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
            Text("\(feedCellService.post?.likeCount ?? 0) likes")
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
            if post.comments > 0{
                Text("View all \(post.comments) comments")
                    .font(.footnote)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,10)
                    .padding(.top,-6)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        presentComment = true
                    }
            }
      
            // time label
            Text("\(post.timestamp.dateValue().timeAgoSinceNow())")
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,-8)
                .foregroundColor(.gray)

            
        }.onAppear{
            Task{
                try await feedCellService.fetchPost(postId: post.id)
                feedCellService.hasLikedPost()
            }
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_Posts[0])
    }
}
