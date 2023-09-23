//
//  CommentView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 23/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentView: View {
    var postId:String
    var user:User = AuthSerivce.shared.currentUser!
    @StateObject var viewModel: CommentViewModel
    @State private var comment  = ""
    @FocusState private var focusedField: Bool
    init(postId: String) {
        self.postId = postId
        self._viewModel = StateObject(wrappedValue: CommentViewModel(postId: postId))
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    
                    
                    if viewModel.isLoading {
                        ProgressView().frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    else{
                        if(viewModel.comments.count == 0){
                            Image("amico3")
                                .resizable()
                                .scaledToFit()
                            Text("No comments found...")
                                .foregroundColor(.pink)
                                .font(.headline)
                            
                        }
                        else{
                            LazyVStack(spacing:12) {
                                ForEach(viewModel.comments){ comment in
                                    
                                    CommentCell(user: user, comment: comment)
                                        .frame(height: 50)
                                      
                                    
                                }
                            }.padding(.top,8)
                        }
                    }
                }
                Spacer()
                Divider()
                HStack(spacing: 1) {
                    
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
                    
                    HStack{
                        TextField("Add a comment for \(user.username) ...", text: $comment,axis: .vertical)
                            .font(.footnote)
                            .lineLimit(4)
                            .padding(.horizontal,1)
                            .focused($focusedField,equals: true)
                            .foregroundColor(.black)
                            .onAppear{
                                focusedField = true
                            }
                        
                        Button{
                            Task{
                                try await viewModel.postComment(comment: comment, postId: postId)
                                comment = ""
                                try await viewModel.fetchComments(postId: postId)
                            }
                        } label: {
                            Text("Post")
                                .foregroundColor(.pink)
                        }
                    }
                    
                    .padding(10)
                    .padding(.horizontal,5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal,10)
                    
                    
                    
                }
                .padding(.top,10)
                .padding(.horizontal)
            }
          
        }
    }
}

#Preview {
    CommentView(postId: "")
}
