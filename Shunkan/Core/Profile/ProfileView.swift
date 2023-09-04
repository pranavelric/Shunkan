//
//  ProfileView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 03/09/23.
//

import SwiftUI

struct ProfileView: View {
    var gradient = Gradient(colors: [.yellow, .red, .purple, .orange, .pink, .red])
    @State var selectedTab:Int = 0
    @State var gridSize: Int = 30
    private let gridItems: [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]

    
    var body: some View {
        ScrollView{
            // header
                        VStack(spacing: 10){
                            // pic and stats
                            HStack{
                                Image("profile_placeholder")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80,height: 80)
                                    .clipShape(Circle())
                                Spacer()
                                HStack(spacing: 8){
                                    UserStackView(value: 3, title: "Posts")
                                    UserStackView(value: 23, title: "Followers")
                                    UserStackView(value: 13, title: "Following")
                                }
            
                            }
                            .padding(.horizontal)
                            .padding(.bottom,8)
            
            
                            // name and bio
                            VStack(alignment: .leading){
            
                                Text("Pranav Elric")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
            
                                Text("Go beyond plus ultra")
                                    .font(.footnote)
            
                                Link(destination: URL(string: "https://pranavelric.dev")!) {
                                    Label("pranavelric.dev", systemImage: "link")
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

            
        }
    }
    

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
