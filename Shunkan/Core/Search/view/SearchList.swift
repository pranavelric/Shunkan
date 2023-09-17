//
//  SearchList.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 06/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchList: View {
    let searchableText:String
    let users: [User]
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing:12) {
                    ForEach(users.filter { user in
                        if searchableText.isEmpty {
                            return true  // Show all users when the search text is empty
                        } else {
//                            return user.username.localizedCaseInsensitiveContains(searchableText)
                            let searchTextLowercased = searchableText.lowercased()
                            return user.username.localizedCaseInsensitiveContains(searchTextLowercased) ||
                                         (user.fullName?.localizedCaseInsensitiveContains(searchTextLowercased) ?? false)
                        }
                    }){ user in
                        NavigationLink (value: user, label: {
                            HStack{
                               
                                
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
                                
                                
                                
                                VStack(alignment: .leading){
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                        
                                    if let fullname = user.fullName{
                                        Text(fullname).font(.footnote)
                                         
                                    }
                                    
                                    
                                }.font(.footnote)
                                Spacer()
                            }.padding(.horizontal)
                                .foregroundColor(.black)
                        })
                    }
                }.padding(.top,8)
          
//                    .searchable(text: $searchableText, prompt: "Search...")
            }
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user).navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct SearchList_Previews: PreviewProvider {
    static var previews: some View {
        SearchList(searchableText: "Test",users: User.MOCK_USERS)
    }
}
