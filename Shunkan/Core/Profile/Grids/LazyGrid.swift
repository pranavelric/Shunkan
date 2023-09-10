//
//  LazyGrid.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 04/09/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct LazyGrid: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]

    let user: User
    let posts: [Post]
    
    
    var body: some View {
        
            LazyVGrid(columns: gridItems,spacing: 1){
                ForEach(posts){ post in
                    
                    if ((user.profilePictureURL) != nil){
                        AnimatedImage(url:   URL(string: post.imageURL) )
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3 )
                            .scaledToFill()
                        
                    }else{
                        Image("profile_placeholder")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3 )
                            .scaledToFill()
                    }
                    
                    
                }
        }
          
            
    }
}

struct LazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        LazyGrid(user: User.MOCK_USERS[0], posts: Post.MOCK_Posts)
    }
}
