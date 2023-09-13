//
//  CurrentUserProfileView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 09/09/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
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
NavigationView {
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
                  Highlights(user: User.MOCK_USERS[0])
              }.padding(.horizontal)
      .padding(.bottom)
  
  
  // post grid
    let height = UIScreen.main.bounds.width / 3
    let multiplier = Double(Post.MOCK_Posts.count) / 3 + 2
    let min_height = height * multiplier
    VStack{
        HeaderTabBar(selectedTab: $selectedTab)

        Grids(selectedTab: $selectedTab, user: User.MOCK_USERS[0],posts: Post.MOCK_Posts)
            .frame(alignment: .top)
            .padding(.top,-200)
            .zIndex(-1.0)  
    }
    .frame(minHeight: CGFloat(min_height) ,alignment: .top)
}
.toolbar{

  if backButtonVisible{
      ToolbarItem(placement: .navigationBarLeading) {
          Image(systemName: "chevron.left")
              .imageScale(.large)
              .onTapGesture {
                  dismiss()
              }
      }
  }
  
  ToolbarItem(placement: .navigationBarLeading) {
      HStack {
                    
          Text("Pranav Elrix")
              .font(.title2)
              .fontWeight(.bold)
              .foregroundColor(.primary)
          Image("bluetick")
              .resizable()
              .aspectRatio( contentMode: .fill)
              .frame(width: 20, height: 20, alignment: .leading)
              .opacity(1)
      }
  }
  ToolbarItem(placement: .navigationBarTrailing){
      
      HStack{
          Button{
              
          } label: {
              Image(systemName: "plus.square.fill").foregroundColor(.gray.opacity(0.6))
          }
          Button{
              
          } label: {
              Image(systemName: "line.3.horizontal").foregroundColor(.gray.opacity(0.6))
          }
      }
  }
  
}


}


}
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
