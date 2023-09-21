//
//  CurrentUserProfileView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 09/09/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct CurrentUserProfileView: View {
    
@State var selectedTab:Int = 0
@State var gridSize: Int = 30
@State var backButtonVisible: Bool = false
@State var createSheetToggle: Bool = false
@State var settingsSheetToggle: Bool = false
@State var showEditProfile: Bool = false

let user:User
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
                
                Link(destination: URL(string: "http://\(user.bioLink ?? "pranavelric.dev")") ?? URL(string: "http://pranavelric.dev")!) {
                    Label( user.bioLink ?? "pranavelric.dev", systemImage: "link")
                        .imageScale(.small).font(.footnote)
                }
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            
            
            // action buttons
            HStack{
                Button{
                    
                    showEditProfile.toggle()
                    
                } label:{
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.vertical, 10)
                        .frame( maxWidth: .infinity)
                        .background(Color.gray.opacity(0.3))
                        
                        .cornerRadius(8)
                }.fullScreenCover(isPresented: $showEditProfile){
                   EditProfileView(user: user)
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
               
        }.zIndex(1)
        //story highlight
        VStack(alignment: .leading){
            Highlights(user:user)
        }
//        .padding(.top)
        .padding(.horizontal)
        .padding(.bottom)
        
        
        // post grid
//        let height = UIScreen.main.bounds.width / 3
//        let multiplier = Double(user.posts.count) / 3 + 2
//        let min_height = height * multiplier
//        VStack{
            HeaderTabBar(selectedTab: $selectedTab)
            
            Grids(selectedTabValue: $selectedTab, user: user)
                .frame(height: UIScreen.main.bounds.height,alignment: .bottom)

//                .frame(alignment: .top)
//                .padding(.top,-200)
//                .zIndex(-1.0)
//        }
//        .frame(minHeight: CGFloat(min_height) ,alignment: .top)
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
                    
          Text("\(user.username)")
              .font(.title2)
              .fontWeight(.bold)
              .foregroundColor(.primary)
          if(user.isBlueTickEnabled){
              Image("bluetick")
                  .resizable()
                  .aspectRatio( contentMode: .fill)
                  .frame(width: 20, height: 20, alignment: .leading)
                  .opacity(1)
          }
      }
  }
  ToolbarItem(placement: .navigationBarTrailing){
      
      HStack{
          Button{
              createSheetToggle.toggle()
          } label: {
              Image(systemName: "plus.square.fill").foregroundColor(.gray.opacity(0.6))
          }
          Button{
              settingsSheetToggle.toggle()
          } label: {
              Image(systemName: "line.3.horizontal").foregroundColor(.gray.opacity(0.6))
          }.sheet(isPresented: $settingsSheetToggle){
              SettingSheets().presentationDetents([ .medium, .large])
                  .presentationDragIndicator(.visible)
                  .presentationCornerRadius(20)
          }
      }
  }
  
}


}


}
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
