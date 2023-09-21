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
  
    let posts: [Post]
    
    
    var body: some View {
        
//        ScrollView{
       
            LazyVGrid(columns: gridItems,spacing: 1){
                ForEach(posts){ post in
                    
                    if ((post.imageURL) != nil){
                        AnimatedImage(url:   URL(string: post.imageURL) )
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3,alignment: .top )
                            .scaledToFill()
                            .clipped()
                        
                        
                    }else{
                        Image("profile_placeholder")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
                            .scaledToFill()
                    }
                    
                    
                }
                       
                
            }
            .frame(height: UIScreen.main.bounds.height,alignment: .top)
        
//        }
          
            
    }
}

struct LazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        LazyGrid(posts: [Post.MOCK_Posts[0]])
    }
}
