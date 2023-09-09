//
//  ProfileView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 03/09/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct ProfileView: View {

             
    let user: User
    @State var selectedTab:Int = 0
    @State var gridSize: Int = 30
    @State var backButtonVisible: Bool = false
    private let gridItems: [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {

            ScrollView{
                // header
                            VStack(spacing: 10){
                                // pic and stats
                                HStack{
                             
                                    
                                    if ((user.profilePictureURL) != nil){
                                        AnimatedImage(url:   URL(string: user.profilePictureURL ?? "") )
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80,height: 80)
                                            .clipShape(Circle())
                                        
                                    }else{
                                        Image("profile_placeholder")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80,height: 80)
                                            .clipShape(Circle())
                                    }
                                    
                                    
                                    
                                    
                                    Spacer()
                                    HStack(spacing: 8){
                                        UserStackView(value: user.posts.count, title: "Posts")
                                        UserStackView(value: user.followers.count, title: "Followers")
                                        UserStackView(value: user.following.count, title: "Following")
                                    }
                
                                }
                                .padding(.horizontal)
                                .padding(.bottom,8)
                
                
                                // name and bio
                                VStack(alignment: .leading){
                
                                    Text(user.fullName ?? user.username)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                
                                    Text( user.bio ?? "Go beyond plus ultra")
                                        .font(.footnote)
                
                                    Link(destination: URL(string: "http://\(user.bioLink ?? "pranavelric.dev")")!) {
                                        Label( user.bioLink ?? "pranavelric.dev", systemImage: "link")
                                            .imageScale(.small).font(.footnote)
                                    }
                
                                }.frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                
                
                                // action buttons
                                HStack{
                                    Button{
                
                                    } label:{
                                        Text("Edit Profile")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black.opacity(0.7))
                                            .padding(.vertical, 10)
                                            .frame( maxWidth: .infinity)
                                            .background(Color.gray.opacity(0.3))
                                            .cornerRadius(8)
                                    }
                
                                    Button{
                
                                    } label:{
                                        Text("Share Profile")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black.opacity(0.7))
                                            .padding(.vertical, 10)
                                            .frame( maxWidth: .infinity)
                                            .background(Color.gray.opacity(0.3))
                                            .cornerRadius(8)
                                    }
                
                                    Button{
                
                                    } label:{
                                        Image(systemName: "person.badge.plus.fill")
                                            .foregroundColor(.black.opacity(0.6))
                                            .padding(10)
                                            .background(Color.gray.opacity(0.3))
                                            .cornerRadius(8)
                                    }
                
                
                                }.padding()
                            }
                            //story highlight
                            VStack(alignment: .leading){
                                Highlights()
                            }.padding(.horizontal)
                    .padding(.bottom)
                
                
                // post grid
                
                    HeaderTabBar(selectedTab: $selectedTab)
                 let temp = UIScreen.main.bounds.width / 3
                 let multiplier = CGFloat (gridSize / 3 )
                   Grids(selectedTab: $selectedTab, gridSize: $gridSize)
                    .frame(height: ((temp) * ( multiplier )  ) + temp)


            }
            .navigationTitle(user.username)
            .navigationBarTitleDisplayMode(.inline)
        
            .toolbar{
             

                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .onTapGesture {
                                dismiss()
                            }
                }
                
        
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    HStack{
                        Button{
                            
                        } label: {
                            Image(systemName: "ellipsis").foregroundColor(.gray.opacity(0.6))
                        }
                     
                    }
                }
                
            }

        }
    }
    

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
