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
            Text("Feed").tabItem {
                Image(systemName: "house")
            }
            Text("Search").tabItem {
                Image(systemName: "magnifyingglass")
            }
            Text("Upload post").tabItem {
                Image(systemName: "plus.square")
            }
            Text("Reels").tabItem {
                Image(systemName: "play.rectangle")
            }
           ProfileView().tabItem {
                Image(systemName: "person") // set image to profile view
            }
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
