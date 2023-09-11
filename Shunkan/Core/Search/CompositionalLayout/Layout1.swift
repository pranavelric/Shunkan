//
//  Layout1.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 05/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct Layout1: View {
    
    let posts: [Post]
    var body: some View {
        HStack(spacing:4){
                   
            AnimatedImage(url: URL(string: posts[0].imageURL))
                       .resizable()
                       .aspectRatio( contentMode: .fill)
                       .frame(width: (UIScreen.main.bounds.width / 3), height: (UIScreen.main.bounds.width / 3) * 2.04)
                       .cornerRadius(4)
                       .frame(maxHeight: .infinity, alignment: .top)
                   HStack(spacing:4){
                       VStack(spacing:4){
                           
                           if posts.count >= 2{
                               AnimatedImage(url: URL(string: posts[1].imageURL))
                                   .resizable()
                                   .aspectRatio( contentMode: .fill)
                                   .frame(width: (UIScreen.main.bounds.width / 3), height: (UIScreen.main.bounds.width / 3) )
                                   .cornerRadius(4)
                           }
                           if posts.count >= 3{
                               AnimatedImage(url: URL(string: posts[2].imageURL))
                                   .resizable()
                                   .aspectRatio( contentMode: .fill)
                                   .frame(width: (UIScreen.main.bounds.width / 3), height: (UIScreen.main.bounds.width / 3))
                                   .cornerRadius(4)
                           }
                       }.frame(maxHeight: .infinity, alignment: .top)
                       VStack(spacing:4){
                           if posts.count >= 4{
                               AnimatedImage(url: URL(string: posts[3].imageURL))
                                   .resizable()
                                   .aspectRatio( contentMode: .fill)
                                   .frame(width: (UIScreen.main.bounds.width / 3), height: (UIScreen.main.bounds.width / 3) )
                                   .cornerRadius(4)
                           }
                           if posts.count >= 5{
                               AnimatedImage(url: URL(string: posts[4].imageURL))
                                   .resizable()
                                   .aspectRatio( contentMode: .fill)
                                   .frame(width: (UIScreen.main.bounds.width / 3), height: (UIScreen.main.bounds.width / 3) )
                                   .cornerRadius(4)
                           }
                       }.frame(maxHeight: .infinity, alignment: .top)
                   }
        }
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
    }
}

struct Layout1_Previews: PreviewProvider {
    static var previews: some View {
        Layout1(posts: Post.MOCK_Posts)
    }
}
