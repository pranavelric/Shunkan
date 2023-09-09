//
//  MainTabView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 03/09/23.
//

import SwiftUI

struct MainTabView: View {
    
    
  
    
    var body: some View {
        TabView{
            FeedView().tabItem {
                Image(systemName: "house")
            }
            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
            }
            Text("Upload post").tabItem {
                Image(systemName: "plus.square")
            }
            Text("Reels").tabItem {
                Image(systemName: "play.rectangle")
            }
           CurrentUserProfileView().tabItem {
                Image(systemName: "person") // set image to profile view
            }
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
