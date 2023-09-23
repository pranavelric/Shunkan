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
    @StateObject var viewModel: PostGridViewModel

    init(selectedTabValue: Binding<Int>, user: User) {
        self.user = user
        self._selectedTab = selectedTabValue
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    

//    let posts: [Post]
    var body: some View {
        
        
    

            

            TabView(selection: $selectedTab){
                LazyGrid( posts: viewModel.posts).tag(0)
                LazyGrid(posts: viewModel.posts).tag(1)
                LazyGrid(posts: viewModel.posts).tag(2)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .onAppear{
             
                    Task{
                        try await viewModel.fetchUserPosts()
                    }
                
            }

            
        
    }
}

struct Grids_Previews: PreviewProvider {
    static var previews: some View {
        Grids(selectedTabValue: .constant(0),user: User.MOCK_USERS[0])
    }
}
