//
//  MainTabView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 03/09/23.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
  
    
    var body: some View {
        TabView(selection: $selectedIndex){
            FeedView()
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem {
                Image(systemName: "house")
                }.tag(0)
            SearchView()
                .onAppear{
                    selectedIndex = 1
                }
                .tabItem {
                Image(systemName: "magnifyingglass")
            }.tag(1)
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear{
                    selectedIndex = 2
                }
                .tabItem {
                Image(systemName: "plus.square")
            }.tag(2)
            Text("Reels")
                .onAppear{
                    selectedIndex = 3
                }
                .tabItem {
                Image(systemName: "play.rectangle")
            }.tag(3)
           CurrentUserProfileView()
                .onAppear{
                    selectedIndex = 4
                }
                .tabItem {
                Image(systemName: "person") // set image to profile view
            }.tag(4)
        }
        .frame(minWidth: UIScreen.main.bounds.width, maxWidth: .infinity, minHeight: UIScreen.main.bounds.height, maxHeight: .infinity, alignment: .topLeading)
        .accentColor(.black)

    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
