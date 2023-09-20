//
//  FeedView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 05/09/23.
//

import SwiftUI

struct FeedView: View {

    @StateObject var viewModel: FeedViewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView{
                
                LazyVStack(spacing: 24){
//                    Highlights(user: User.MOCK_USERS[0])
//                    Divider()
                    // sort the post according to time, and show only post of followings
                    ForEach(viewModel.posts){ post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top,8)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {

                        Image("font_white_bg")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 100, height: 32, alignment: .leading)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    HStack{
                        Button{
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        Button{
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(.gray.opacity(0.6))
                }
                
            } .navigationDestination(for: User.self) { user in
                ProfileView(user: user).navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
