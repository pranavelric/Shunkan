//
//  FeedCell.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 05/09/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            // profile-pic- username feed-settings button
            HStack{
                Image("profile_placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30,height: 30)
                    .clipShape(Circle())
                
                Text("Pranav Elric")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Image("bluetick")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 12, height: 12, alignment: .leading)
                    .opacity(1)
                Spacer()
                
                Button{
                    
                } label: {
                    Image(systemName: "ellipsis").foregroundColor(.gray.opacity(0.6))
                }
                
            }.padding(.horizontal,8)
            
            // post content
            Image("profile_placeholder")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
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
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            //caption label
            
            HStack {
                Text("Pranav Elric ")
                    .fontWeight(.semibold) +
                Text("this is some test caption")
                
            } .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,1)
                .padding(.leading,10)
            
            //comment-label
            Text("View all 24 comments")
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
                .foregroundColor(.gray)
            
            // time label
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
                .foregroundColor(.gray)
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
