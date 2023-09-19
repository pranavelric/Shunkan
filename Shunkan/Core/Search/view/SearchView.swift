//
//  SearchView.swift
//  Shunkan
//
//  Created by Pranav Choudhary on 05/09/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct SearchView: View {
    @State var search: String = ""
    @State var text: String = ""
    @State private var offset: Int = 0
    let post: [Post]
    @StateObject var viewModel = SearchFeedViewModel()
    var body: some View {

            NavigationStack{
                GeometryReader { _ in
                ScrollView{
                    
                    
                    
                    
                    
                    if viewModel.post.isEmpty {
                        ProgressView().frame(maxWidth: .infinity, maxHeight: .infinity)
                    }else{
                        ScrollView{
                            VStack(spacing: 4){
                                ForEach(viewModel.compositionalArray.indices,id: \.self){index in
                                    
                                    // Check if offset is within bounds
                                    if index == 0 || index % 6 == 0 {
                                        Layout1(posts: viewModel.compositionalArray[index])
                                        
                                        
                                    } else if index % 3 == 0 {
                                        
                                        Layout3(posts: viewModel.compositionalArray[index])
                                        
                                    } else {
                                        
                                        Layout2(posts: viewModel.compositionalArray[index])
                                        
                                    }
                                    
                                    
                                }
                                
                            }
                        }
                    }
                    
                }.ignoresSafeArea(.keyboard,edges: .all)
                .navigationBarItems(
                    trailing:
                        Text("")
                )
                .navigationSearchBar(text: $text,
                                     
                                     options: [
                                        .automaticallyShowsSearchBar: true,
                                        .obscuresBackgroundDuringPresentation: true,
                                        .hidesNavigationBarDuringPresentation: true,
                                        .hidesSearchBarWhenScrolling: true,
                                        .placeholder: "Search",
                                        .showsBookmarkButton: true,
                                     ],
                                     
                                     actions: [
                                        .onCancelButtonClicked: {
                                            print("Cancel")
                                        },
                                        .onSearchButtonClicked: {
                                            print("Search")
                                        }
                                     ], searchResultsContent: {
                                         SearchList(searchableText: text,users: viewModel.users)
                                         
                                         
                                     })
            }.ignoresSafeArea(.keyboard,edges: .all)
        }.ignoresSafeArea(.keyboard,edges: .all)
            
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(post: Post.MOCK_Posts)
    }
}
