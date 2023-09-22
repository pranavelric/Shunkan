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
    
    
//    var posts: [Post]{
//        return Post.MOCK_Posts.filter({$0.user?.username == user.username})
//    }
//    
    
    
    @State var selectedTab:Int = 0
    @State var gridSize: Int = 0
    @State var backButtonVisible: Bool = false
    private let gridItems: [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]
    @Environment(\.dismiss) var dismiss
    
    @State var showEditProfile: Bool = false
    @State var createSheetToggle: Bool = false
    @State var settingsSheetToggle: Bool = false
    
    
    
    @StateObject var viewModel :ProfileViewModel
    
    @State var showError = false
    @State var errorMsg: String? = nil
    @State private var showSheet:Bool = false
    
    init(user:User){
            self.user = user
            self._viewModel = StateObject(wrappedValue: ProfileViewModel(userId: user.id))
    }
    
    
    var body: some View {

            ScrollView{
                // header
//                VStack{
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
                                UserStackView(value: user.posts, title: "Posts")
                                UserStackView(value: viewModel.followers, title: "Followers")
                                UserStackView(value: viewModel.followings, title: "Following")
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
                            }.foregroundColor(.pink)
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        
                        // action buttons
                        HStack{
                            Button{
                                if(user.isCurrentUser){
                                    showEditProfile.toggle()
                                }else{
                                    Task{
                                        
                                        
                                        withAnimation {
                                            viewModel.isProcessing = true
                                        }

                                        // Perform the task (creating a user in this case)
                                        do {
                                            
                                            try await viewModel.follow(userId: user.id)
                                            
                                            
                                            
                                        } catch {
                                            // Handle any errors that occur during user creation
                                            showError = true
                                            errorMsg = error.localizedDescription
                                            print("Error : \(error)")
                                        }

                                        // Hide the ProgressView after the task is completed
                                        withAnimation {
                                            viewModel.isProcessing = false
                                        }
                                        
                                        
                                     
                                    }
                                }
                            } label:{
                                if (!user.isCurrentUser){
                                    if (viewModel.isProcessing){
                                        ProgressView().frame(maxWidth: .infinity,minHeight: 40)
                                            .foregroundColor(.white)
                                            .background(.pink)
                                            .cornerRadius(8)
                                    }else{
                                        Text((viewModel.followCheck) ? "Unfollow": "Follow")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                            .padding(.vertical, 10)
                                            .frame( maxWidth: .infinity)
                                            .background(.pink)
                                            .cornerRadius(8)
                                    }
                                  
                                }else{
                                    Text("Edit Profile")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black.opacity(0.7))
                                        .padding(.vertical, 10)
                                        .frame( maxWidth: .infinity)
                                        .background(Color.gray.opacity(0.3))

                                        .cornerRadius(8)
                                }
                            }.fullScreenCover(isPresented: $showEditProfile){
                                EditProfileView(user: user)
                             }
                            .alert(isPresented: $showError){
                               Alert(title: Text("Failed to \((viewModel.followCheck) ? "Unfollow": "Follow") "), message: Text("\(errorMsg ?? "")"), dismissButton: .default(Text("OK") ))
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
                        Highlights(user: user)
                    }.padding(.horizontal)
                        .padding(.bottom)
                    
                    
                    // post grid
                        HeaderTabBar(selectedTab: $selectedTab)
//                        let temp = UIScreen.main.bounds.width / 3
//                        let tempHeight =  UIScreen.main.bounds.height
//                        let multiplier = CGFloat (posts.count / 3 )
                       
                Grids(selectedTabValue: $selectedTab,user: user)
//                            .frame(height: ((temp) * ( multiplier  )  ) + temp,alignment: .bottom)
                            .frame(height: UIScreen.main.bounds.height,alignment: .bottom)
                    
                    
//                }
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
                
      
                if(user.isCurrentUser){
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
                    else{
                    ToolbarItem(placement: .navigationBarTrailing){
                        
                        HStack{
                            Button{
                                
                            } label: {
                                Image(systemName: "ellipsis").foregroundColor(.gray.opacity(0.6))
                            }
                            
                        }
                    }
                }
            }.onAppear{
                Task{
                    try await AuthSerivce.shared.loadUserData()
                    
                    try await viewModel.loadData(userId: user.id)
                }
                  
            }

        }
    }
    

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
