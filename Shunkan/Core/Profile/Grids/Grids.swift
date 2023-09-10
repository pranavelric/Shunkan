//
//  Grids.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 04/09/23.
//

import SwiftUI

struct Grids: View {
    @Binding var selectedTab:Int
    let user: User
    let posts: [Post]
    var body: some View {
        
        


                TabView(selection: $selectedTab){
                    LazyGrid( user: user,posts: posts).tag(0)
                    LazyGrid(user: user,posts: [Post.MOCK_Posts[0]]).tag(1)
                    LazyGrid(user: user,posts: posts).tag(2)
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                
    }
}

struct Grids_Previews: PreviewProvider {
    static var previews: some View {
        Grids(selectedTab: .constant(0),user: User.MOCK_USERS[0],posts: Post.MOCK_Posts)
    }
}
